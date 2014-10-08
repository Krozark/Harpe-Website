from django.core.management.base import BaseCommand, CommandError
try:
    import cElementTree as ET
except ImportError:
  try:
    # Python 2.5 need to import a different module
    import xml.etree.cElementTree as ET
  except ImportError:
    exit_err("Failed to import cElementTree from any known place")

from django.db.models import Q

from website.models import *
from website import logs

class Command(BaseCommand):
    args = 'filename'
    help = 'import a xml file of ProteinPilot'

    def handle(self, *args, **options):
        if len(args)<1:
            raise CommandError("No filename specify")

        for filename in args:
            logs.note("=== Parse file "+filename+" ===")
            try:
                dom = ET.parse(open(filename, "r"))
                root = dom.getroot()
            except:
                raise CommandError("Unable to open and parse file: " + filename)

            for data in root:
                t = data.tag
                if t == "El": #Atoms
                    self.parse_atom(data)
                elif t == "AA" : #animo acids
                    self.parse_amino_acid(data)
                elif t =="Mod": #PTM
                    self.parse_modification(data)
                elif t == "CAgt": #Enzyme
                    self.parse_enzyme(data)
                elif t == "AIn": #ions
                    self.parse_ion(data)
                else:
                    raise CommandError("Unknow data type")

    @staticmethod
    def parse_atom(data):
        #needed
        name = data.find("Nme").text
        pk = int(data.find("ANr").text)
        slug = data.find("Sym").text
        isotopes = data.findall("Iso")
        logs.note("Atom %s" % name)
        if len(isotopes) == 0:
            raise CommandError("Atom %s don't have any isotopes" % name)

        atoms = Atom.objects.filter(Q(name=name) | Q(slug=slug))
        if len(atoms) > 1:
            raise CommandError("Atom %s is multiple time in the data base" % name)
        elif len(atoms) == 1:
            logs.warning("Atom %s find in database" % (atoms[0]))
            atoms = atoms[0]
        else:
            logs.ok("Atom %s created" % (name))
            atoms = Atom()
        
        atoms.name = name
        atoms.per_id = pk
        atoms.slug = slug

        atoms.save()

        for isotope in isotopes:
            mass = float(isotope.find("Mss").text)
            freq = float(isotope.find("Pry").text)

            iso = AtomIsotope.objects.filter(atom=atoms,mass=mass,frequence=freq)[:1]
            if not iso:
                iso = AtomIsotope()
                iso.mass = mass
                iso.frequence = freq
                iso.atom = atoms
                iso.save()
                logs.ok("Isotope %s of %s added" % (iso,atoms))
            else:
                logs.warning("Isotope %s of %s skiped" % (iso[0],atoms))
        return

    @staticmethod
    def parse_amino_acid(data):
        #needed
        name = data.find("Nme").text
        slug = data.find("TLC").text
        code = data.find("OLC")
        if code != None:
            code = code.text
        formule = data.find("Fma")
        type = AAType.objects.get(name=("default" if code != None else "TODO"))
        fk_aa = None
        fk_mod = None
        mass = 0

        logs.note("AA %s" % name)

        if formule == None:
            data = data.find("RfAA")
            if data == None:
                logs.error("No formule, and no references to other amino acid find")
                return
            fk_aa = AA.objects.filter(name=data.text)[:1]
            if not fk_aa:
                logs.error("No amino acide \"%s\" find in database" % data)
                return
            fk_aa = fk_aa[0]
            data = data.find("RfM")
            if data == None:
                logs.error("No formule, and no references to PTM find")
                return
            fk_mod = AAModification.objects.filter(name=data.text)[:1]
            if not fk_mod:
                logs.error("No Modicication \"%s\" find in database" % name)
                return
            fk_mod = fk_mod[0]
            is_default = False
            mass = fk_aa.mass + fk_mod.delta
        else:
            formule = formule.text
            mass = Atom.to_mass(formule)

        a = AA.objects.filter(name=name)[:1]
        if a:
            logs.warning("Amino acid %s find in database" % a[0])
            return
        a = AA()
        a.name = name
        a.slug = slug
        a.code = code
        a.formule = formule
        a.type = type
        a.mass = mass
        a.fk_aa = fk_aa
        a.fk_mod = fk_mod

        logs.ok("Amino acid %s created" % a)

        a.save()
        return

    @staticmethod
    def ts_to_position(number):
        if number == 4: #N-terminal
            return 2
        elif number == 10: #C-terminal
            return 3
        elif number == 255:#partout
            return 1
        else:
            logs.warning("Position %d unknow" % number)
            return number if number > 3 else 0


    @staticmethod
    def parse_modification(data):
        name = data.find("Nme").text
        slug = data.find("TLC").text
        AAs = data.findall("Tgt")
        delta = 0
        ts = data.find("TS")
        if ts != None:
            ts = int(ts.text)
        else:
            ts = 0
        ts = Command.ts_to_position(ts)
        formule_added = data.find("Fma").text or ""
        formule_remove = data.find("RpF").text or ""
        fk_mod = data.find("DisplayName")

        logs.note("Modification %s" % name)

        save = False

        mod = AAModification.objects.filter(Q(name=name)|Q(slug=slug))[:1]
        if mod:
            mod = mod[0]
            logs.warning("Modification %s already existe" % mod)
        else:
            if fk_mod != None:
                mod = AAModification.objects.filter(name=fk_mod.text)[:1]
                if not mod:
                    logs.error("AAModification, DisplayName %s does't refer to a existing AAModification" % fk_mod.text)
                    return
                mod = mod[0]
            else:
                mod = AAModification()
                save = True
        #mod = AAModification.objects.filter(Q(name=name)|Q(slug=slug))[:1]
        #if not mod:
        #    mod = AAModification()
        #    save = True
        #else:
        #    mod = mod[0]


        if save:
            mod.TS = ts
            mod.name = name
            mod.delta = Atom.to_mass(formule_added) - Atom.to_mass(formule_remove)
            mod.slug = slug
            logs.ok("Create AAModification %s" % mod)
            mod.save()
        
        if AAs:
            for a in AAs:
                if a.text == None:
                    break
                aa = AA.objects.filter(Q(name=a.text)|Q(slug=a.text) |Q(code=a.text))
                if not aa:
                    logs.warning("No Amino acide find for the name/slug/code \"%s\"" % a.text)
                    break
                if len(aa) > 1:
                    logs.warning("More than 1 Amino acide find for the name/slug/code \"%s\"" % a.text)
                    break
                aa = aa[0]
                pos = AAModificationPosition.objects.filter(AA=aa,modification=mod)[:1]
                if pos:
                    logs.warning("AAModification already exist \"%s\"" % pos[0])
                    break
                pos = AAModificationPosition()
                pos.AA = aa
                pos.modification = mod
                pos.position = ts
                logs.ok("Create AAModificationPosition %s" % pos)
                pos.save()
        else:
            logs.note("No Tgt tag find, so all default AAs are added")
            for aa in AA.objects.filter(type=2).exclude(pk__in=[ u.AA.pk for u in AAModificationPosition.objects.filter(modification=mod)]):
                pos = AAModificationPosition()
                pos.AA = aa
                pos.modification = mod
                pos.position = ts
                logs.ok("Create AAModificationPosition %s" % pos)
                pos.save()


        return

    @staticmethod
    def parse_enzyme(data):
        return

    @staticmethod
    def parse_ion(data):
        return


