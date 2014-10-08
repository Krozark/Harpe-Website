# -*- coding: utf-8 -*-

from django.core.urlresolvers import reverse#,reverse_lazy
from django.db import models
from django.db.models.signals import post_delete
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.models import User
from django.db.models import Count
from django.db.models import Avg, Max, Min

from Kraggne.contrib.gblocks.utils import file_cleanup

####### ATOMS ##############
class Atom(models.Model):
    per_id      = models.IntegerField(_("number in periodic table"))
    name        = models.CharField(_("name"),max_length=255,unique=True)
    slug        = models.CharField(_("short name"),max_length=2)

    paginate_by = None

    class Meta:
        ordering = ("per_id",)

    @property
    def mass(self):
        atom = AtomIsotope.objects.filter(atom=self.pk).order_by("-frequence")[:1]
        return atom[0].mass

    @staticmethod
    def count(seq):
        import re
        regex = "([A-Z][a-z]?)([0-9]*)"
        sp = re.split(regex,seq)[1:-1]
        res = {}
        i = 0
        while i < len(sp):
            slug = sp[i]
            number = int(sp[i+1] or 1)
            res[slug] = res.get(slug,0) + number
            i+=3
        return res

    @staticmethod
    def to_mass(seq):
        import re
        regex = "([A-Z][a-z]?)([0-9]*)"
        sp = re.split(regex,seq)[1:-1]
        i = 0
        mass = 0.0
        while i < len(sp):
            slug = sp[i]
            number = int(sp[i+1] or 1)

            atom = Atom.objects.get(slug=slug)
            mass += atom.mass * number
            i+=3
        return mass

    @staticmethod
    def get_dif(seq_1,seq_2):
        c_1 = Atom.count(seq_1)
        c_2 = Atom.count(seq_2)

        keys = c_1.keys()
        keys.extend(c_2.keys())
        keys = set(keys)
        res = ""
        for key in keys:
            n = int(c_1.get(key,0)) - int(c_2.get(key,0))
            if n != 0:
                if n == 1:
                    res += key
                else:
                    res += "%s%d" % (key,n)
        return res


    def __unicode__(self):
        return u"%s" % self.slug

class AtomIsotope(models.Model):
    atom        = models.ForeignKey(Atom)
    mass        = models.FloatField(_("mass"))
    frequence   = models.FloatField(_("frequence"))

    class Meta:
        ordering = ['atom','-frequence']

    def __unicode__(self):
        return u"%s%d" % (self.atom,self.mass)

############## AMINO ACIDS ###############

class AAType(models.Model):
    name        = models.CharField(_("name"),max_length=255,unique=True)

    def __unicode__(self):
        return u"%s" % self.name

class AA(models.Model):
    name        = models.CharField(_("name"),max_length=255,unique=True)
    slug        = models.CharField(_("short name"),max_length=16)
    code        = models.CharField(_("1 letter code"),max_length=1)
    formule     = models.TextField(_("Chimical fomula"))
    type        = models.ForeignKey(AAType,default=1)
    mass        = models.DecimalField(_("mass"),max_digits=15,decimal_places=10)

    fk_aa       = models.ForeignKey("AA",null=True,blank=True)
    fk_mod      = models.ForeignKey("AAModification",null=True,blank=True)

    paginate_by = None

    class Meta:
        ordering = ["name",]
        verbose_name = _(u"Acide aminé")


    def __unicode__(self):
        return "%s" % self.code or self.slug

############" PTM  #################
class AAModificationPosition(models.Model):
    CHOICES = (
        (0,"TODO"),
        (1,"partout"),
        (2,"N-term"),
        (3,"C-term"),
        )

    AA              = models.ForeignKey(AA)
    modification    = models.ForeignKey("AAModification")
    position        = models.IntegerField(default=0,choices=CHOICES)

    class Meta:
        ordering = ["AA__slug","modification__name"]
        verbose_name = _(u"Modification post traductionelle d'un AA")

    def print_no_prefix(self):
        return self.modification.__print__(self.AA,self.position,prefix=False)

    def __unicode__(self):
        return self.modification.__print__(self.AA,self.position)

class ModType(models.Model):
    name        = models.CharField(_("name"),max_length=255,unique=True)

    def __unicode__(self):
        return u"%s" % self.name

class AAModification(models.Model):
    name        = models.CharField(_("name"),max_length=255,unique=True)
    slug        = models.CharField(_("short name"),max_length=255)
    delta       = models.DecimalField(_("delta"),max_digits=15,decimal_places=10)
    AAs         = models.ManyToManyField(AA,through=AAModificationPosition)
    TS          = models.IntegerField()
    type        = models.ForeignKey(ModType,default=1)

    paginate_by = None

    class Meta:
        ordering = ["name",]
        verbose_name = _(u"Modification post traductionelle")

    def get_AAs(self):
        res = ""
        for u in AAModificationPosition.objects.filter(modification=self.pk):
            res += "%s\n" % u
        return res

    def __print__(self,AA,position=1,prefix=True):
        res = ""
        if prefix:
            res += "%s" % self.name
        res += "[%s]" % (AA)
        if position == 2:
            res +="@N-term"
        elif position == 3:
            res += "@C-term"
        return res

    def __unicode__(self):
        return u"%s" % self.name



############" AGENTS #####################"

class ImpossibleCut(models.Model):
    first = models.ForeignKey(AA,related_name="first")
    second = models.ForeignKey(AA,related_name="second")

    class Meta:
        verbose_name = _(u"Coupure d'enzyme impossible")

    def __unicode__(self):
        return "%s - %s" % (self.first,self.second)

class Enzyme(models.Model):
    name = models.CharField(_("name"),max_length=255,unique=True)
    cut_before = models.ManyToManyField(AA,null=True,blank=True,related_name="AA_before")
    cut_after = models.ManyToManyField(AA,null=True,blank=True,related_name="AA_after")
    cut_imposible = models.ManyToManyField(ImpossibleCut,null=True,blank=True)

    class Meta:
        ordering = ["name",]
        verbose_name = _("Enzyme")


    @property
    def direction(self):
        if self.cut_before.all().count() > 1:
            return -1
        if self.cut_after.all().count() > 1:
            return 1
        return 0

    def __unicode__(self):
        return "%s" % self.name


#############" ANALYSES ###########################


class AnalyseMgf(models.Model):

    MAX_CHARGE      = [(0,"---"),(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10)]
    owner           = models.ForeignKey(User)
    name            = models.CharField(_("name"),max_length=255,unique=True)
    enzyme          = models.ForeignKey(Enzyme,blank=True,null=True)

    mgf             = models.FileField(_("MGF"),upload_to="mgf/")

    max_charge      = models.IntegerField(_("Max charge"),choices=MAX_CHARGE,default=0)
    error           = models.FloatField(_("Error delta (in Da)"),default=0.05)

    descriptif      = models.TextField(_("Descriptif"),blank=True)
    created         = models.DateTimeField(_("Created"),auto_now=True)

    AAs             = models.ManyToManyField(AA)
    modifications   = models.ManyToManyField(AAModification,blank=True,null=True)

    ignore      = models.BooleanField(_("Ignore (for learning)"),default=True)


    paginate_by = 10

    class Meta:
        ordering = ["-created",]
        unique_together = ("owner","name")
        verbose_name = _(u"Analyse de fichier Mgf")

    def get_peptide_count(self):
        return self.analysepeptide_set.count()

    def __unicode__(self):
        return u"%s" % self.name

    def get_none_default_aa(self):
        return self.AAs.filter(type=2)

    def can_analyse(self):
        return AnalysePeptide.objects.filter(analyse=self.pk).count() <= 0

    def get_done(self):
        return AnalysePeptide.objects.filter(analyse=self.pk,status__gt=0).aggregate(count=Count("id"))["count"]

    def get_done_ok(self):
        return AnalysePeptide.objects.filter(analyse=self.pk,status=1).aggregate(count=Count("id"))["count"]

    def analysepeptide_set_count(self):
        return AnalysePeptide.objects.filter(analyse=self.pk).aggregate(count=Count("id"))["count"]

    def get_analyse_url(self):
        return reverse("analyse-analyse",kwargs={"pk":self.pk})

    def get_ajax_url(self):
        return reverse("analyse-detail-ajax",kwargs={"pk":self.pk})

    def get_absolute_url(self):
        return reverse("analyse-detail",kwargs={"pk":self.pk})

    def get_blast_url(self):
        return reverse("blast-create")+("?ana=%d" % self.pk)

post_delete.connect(file_cleanup, sender=AnalyseMgf, dispatch_uid="AnalyseMgf.file_cleanup")


class AnalysePeptide(models.Model):

    STATUS  = (
        (0,'-'),
        (1,u'calculé'),
        (2,u'timeout'),
        (3,u'out of memory'),
        )
    analyse     = models.ForeignKey(AnalyseMgf,null=False,blank=False)
    name        = models.CharField(_("name"),max_length=255,null=True,blank=True)
    mgf_part    = models.TextField(_("Peptide MGF"),blank=False,null=False)
    cmpd        = models.IntegerField(_("Compound"),blank=False,default=0)
    mz          = models.FloatField(_("Mz"),blank=False,null=False)
    mass        = models.FloatField(_("mass"),blank=False,null=False)
    intensity   = models.IntegerField(_("Intensity"),blank=False,null=False)
    charge      = models.IntegerField(_("Charge"),blank=False,null=False)
    status      = models.IntegerField(_("status"),default=False,choices=STATUS)

    class Meta:
        ordering = ["analyse",]
        verbose_name = _(u"Peptide")


    @property
    def score_min(self):
        return CalculatedPeptide.objects.filter(analyse=self.pk).aggregate(score=Min('score'))["score"] or ""

    @property
    def score_max(self):
        return CalculatedPeptide.objects.filter(analyse=self.pk).aggregate(score=Max('score'))["score"] or ""

    @property
    def sequence(self):
        top = CalculatedPeptide.objects.filter(analyse=self.pk).order_by('-score')[:1]
        if top:
            top=top[0]
            return top.sequence
        return ""

    @property
    def sequence_aa(self):
        top = CalculatedPeptide.objects.filter(analyse=self.pk).order_by('-score')[:1]
        if top:
            top=top[0]
            return top.sequence_aa
        return ""

    def get_calculated(self,nb,MIN_SIZE):
        """renvoie la liste des X premières solutions non redondantes"""
        cals = CalculatedPeptide.objects.filter(analyse=self.pk).order_by("-score").all()
        i = 0
        prev = ""
        res = []
        for pep in cals:
            if (pep.sequence_aa in prev) or len(pep.sequence_aa) < MIN_SIZE:
                #redondance
                continue
            ok = True
            for u in res:
                if pep.sequence_aa in u.sequence_aa:
                    #redondance
                    ok = False
                    break

            if not ok:
                continue

            prev = pep.sequence_aa
            res.append(pep)
            i+=1
            if i >= nb:
                break
        return res


    class Meta:
        ordering = ['analyse',]
        verbose_name = _(u"Analyse d'un peptide")

    def __unicode__(self):
        return "%s : %s" % (self.analyse,self.name or self.pk)

    def get_absolute_url(self):
        return reverse("peptide-detail",kwargs={"pk":self.pk})

    def get_ajax_url(self):
        return reverse("peptide-detail-ajax",kwargs={"pk":self.pk})

class AnalysePeptideValidated(models.Model):
    score       = models.FloatField(_("Score"),null=False,blank=False)
    analyse     = models.ForeignKey(AnalysePeptide,null=False,blank=False)
    sequence    = models.TextField(_(u"Séquence"),null=False,blank=False,help_text = u"[AA.code]*")
    modification_seq = models.TextField(_("Modifications"),null=True,blank=True)
    modifications   = models.ManyToManyField(AAModification,blank=True,null=True)

    def __unicode__(self):
        return u"%s" % self.analyse



class CalculatedPeptide(models.Model):
    score       = models.FloatField(_("Score"),null=False,blank=False)
    sequence    = models.TextField(_("Séquence"),null=False,blank=False,help_text = u"peak_masse(,AA_id,peak_masse)*")
    sequence_aa = models.TextField(_("Séquence AA"),null=False,blank=False,help_text = u"AA[-AA]*")
    
    analyse     = models.ForeignKey(AnalysePeptide,null=False,blank=False)

    error_total                     = models.FloatField(null=False,blank=False)
    error_aa_cumul                  = models.FloatField(null=False,blank=False)
    intensitee_total_parent         = models.FloatField(null=False,blank=False)
    intensitee_total                = models.FloatField(null=False,blank=False)
    mass_total                      = models.FloatField(null=False,blank=False)
    percent_couverture              = models.FloatField(null=False,blank=False)
    nb_aa                           = models.FloatField(null=False,blank=False)
    nb_peaks                        = models.FloatField(null=False,blank=False)
    mass_parent                     = models.FloatField(null=False,blank=False)
    percent_intensitee_utilisee     = models.FloatField(null=False,blank=False)


    class Meta:
        ordering = ['analyse','-score']
        verbose_name = _(u"Proposition de peptide")

    def __unicode__(self):
        return "%s : %f" % (self.analyse.name, self.score)

    @property
    def sequence_AA(self):
        return self.sequence.split(',')

    def get_absolute_url(self):
        return self.analyse.get_absolute_url()+"?cal=%d"%self.pk


class BlastAnalyse(models.Model):
    #http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastDocs&DOC_TYPE=ProgSelectionGuide#prot_db
    #TODO mettre tous se bordel dans une table séparée (pareil pour program)
    DATABASE_CHOICES =   (
        ('Protein',(
             ("nr","Non-redundant GenBank CDS translations + PDB + SwissProt + PIR + PRF, excluding those in env_nr"),
             ("refseq","Protein sequences from NCBI Reference Sequence project"),
             ("swissprot","	Last major release of the SWISS-PROT protein sequence database (no incremental updates)"),
             ("pat","Proteins from the Patent division of GenBank"),
             ("month","All new or revised GenBank CDS translations + PDB + SwissProt + PIR + PRF released in the last 30 days"),
             ("pdb","Sequences derived from the 3-dimensional structure records from the Protein Data Bank"),
             ("env_nr","Non-redundant CDS translations from env_nt entries"),
         )),
        #('Nucleotide',(
        #    ("nr","All GenBank + EMBL + DDBJ + PDB sequences (but no EST, STS, GSS, or phase 0, 1 or 2 HTGS sequences)"),
        #    ("refseq_mrna","mRNA sequences from NCBI Reference Sequence Project"),
        #    ("refseq_genomic","Genomic sequences from NCBI Reference Sequence Project"),
        #    ("est","Database of GenBank + EMBL + DDBJ sequences from EST division"),
        #    ("est_human","Human subset of est"),
        #    ("est_mouse","Mouse subset of est"),
        #    ("est_others","Subset of est other than human or mouse"),
        #    ("gss","Genome Survey Sequence, includes single-pass genomic data, exon-trapped sequences, and Alu PCR sequences"),
        #    ("htgs","Unfinished High Throughput Genomic Sequences: phases 0, 1 and 2. Finished, phase 3 HTG sequences are in nr"),
        #    ("pat","Nucleotides from the Patent division of GenBank"),
        #    ("pdb","Sequences derived from the 3-dimensional structure records from Protein Data Bank. They are NOT the coding sequences for the coresponding proteins found in the same PDB record"),
        #    ("month","All new or revised GenBank+EMBL+DDBJ+PDB sequences released in the last 30 days"),
        #    ("alu_repeats","Select Alu repeats from REPBASE, suitable for masking Alu repeats from query sequences. See 'Alu alert' by Claverie and Makalowski, Nature 371: 752 (1994)"),
        #    ("dbsts","Database of Sequence Tag Site entries from the STS division of GenBank + EMBL + DDBJ"),
        #    ("chromosome","Complete genomes and complete chromosomes from the NCBI Reference Sequence project. It overlaps with refseq_genomic"),
        #    ("wgs","Assemblies of Whole Genome Shotgun sequences"),
        #    ("env_nt","Sequences from environmental samples, such as uncultured bacterial samples isolated from soil or marine samples. The largest single source is Sagarsso Sea project. This does NOT overlap with nucleotide nr"),
        #)),
        #'Genome',(
        #    ("genome",""),
        #),
    )
    #TODO faire une table à part
    PROGRAM_BLASTN  = "blastn"
    PROGRAM_BLASTP  = "blastp"
    PROGRAM_BLASTX  = "blastx"
    PROGRAM_TBLASTN = "tblastn"
    PROGRAM_TBLASTX = "tblastx"
    PROGRAM_CHOICE  =(
        (PROGRAM_BLASTN,"nucleotide databases using a nucleotide query"),
        (PROGRAM_BLASTP,"protein databases using a protein query"),
        (PROGRAM_BLASTX," protein databases using a translated nucleotide query."),
        (PROGRAM_TBLASTN,"translated nucleotide databases using a protein query"),
        (PROGRAM_TBLASTX,"translated nucleotide databases using a translated nucleotide query")
    )

    analyse         = models.ForeignKey(AnalyseMgf,blank=False,null=False)
    database        = models.CharField(_("Base de donnée"),max_length=255,default="swissprot",choices=DATABASE_CHOICES)
    program         = models.CharField(_("Program"),max_length=16,default=PROGRAM_BLASTP,choices=PROGRAM_CHOICE)
    xml             = models.FileField(_("blast result xml file"),upload_to="blast_analyse/xml/",blank=True,null=True)
    fasta           = models.FileField(_("fasta guery file"),upload_to="blast_analyse/fasta",blank=True,null=True)
    nb_seq_pep_pep  = models.IntegerField(_(u"Nombre de séquence maximal par peptide"),default=5)
    min_seq_size    = models.IntegerField(_("Nombre de AA minimal par sequence"),default=3)

    def get_status(self):
        if self.fasta:
            if self.xml:
                return "ok"
            return "working"
        return "no"


    def __unicode__(self):
        return u"blast %s" % self.analyse


    def make_fasta(self,MAX_PROP_PER_PEP,MIN_PEP_SEQU_SIZE):
        fasta = ""
        for u in self.analyse.analysepeptide_set.order_by("pk").all():
            nb_pep = 0
            for v in u.get_calculated(MAX_PROP_PER_PEP,MIN_PEP_SEQU_SIZE):
                for sens,seq in enumerate([v.sequence_aa,v.sequence_aa[::-1]]): #sequence and reverse sens(0 = normal, 1 = reverse)
                    fasta +=">ana|%d|pep|%d|sens|%d\n" % (u.pk,v.pk,sens)
                    i = 0
                    size = len(seq)
                    while i<size:
                        fasta += seq[i:i+79] + "\n"
                        i+=80
        return fasta

    def blast(self,MAX_PROP_PER_PEP=None,MIN_PEP_SEQU_SIZE=None,reset=True):
        from Bio.Blast import NCBIWWW, NCBIXML
        from django.core.files.base import ContentFile
        
        if not MAX_PROP_PER_PEP:
            MAX_PROP_PER_PEP = self.nb_seq_pep_pep
        if not MIN_PEP_SEQU_SIZE:
            MIN_PEP_SEQU_SIZE  = self.min_seq_size

        ##set file content
        if reset:
            ##del fasta if exist
            if self.fasta:
                self.fasta.delete()
            ##del xml if exist
            if self.xml:
                self.xml.delete()

            fasta = self.make_fasta(MAX_PROP_PER_PEP,MIN_PEP_SEQU_SIZE)
            self.fasta.save("fasta_%d.fasta"%self.pk,ContentFile(fasta))

            result_handle = NCBIWWW.qblast("blastp", "nr",fasta,
                                           word_size=2,
                                           expect=200000,
                                           hitlist_size=100,
                                           gapcosts="9 1",
                                           matrix_name="PAM30",
                                           threshold=11,
                                          )
            del fasta

            result_handle = result_handle.read()

            self.xml.save("results_%d.xml"%self.pk,ContentFile(result_handle))
            del result_handle

        ##results
        blast_records = NCBIXML.parse(self.xml)
        i = 1
        for blast_record in blast_records:
            ids = blast_record.query.split("|")
            ana_id = int(ids[1])
            pep_id = int(ids[3])
            del ids
            ana = AnalysePeptide.objects.get(pk=ana_id)
            pep = CalculatedPeptide.objects.get(pk=pep_id,analyse=ana)
            
            #del exesting blast results
            BlastCalculatedPeptide.objects.filter(blast=self,calculatedpeptide=pep).delete()

            for alignment in blast_record.alignments:
                for hsp in alignment.hsps:
                    for title in alignment.title.split(">"):
                        res                     = BlastCalculatedPeptide()
                        res.blast               = self
                        res.calculatedpeptide   = pep
                        res.gi                  = title.split("|",2)[1]#gi|id|...
                        res.title               = title.strip()
                        res.score               = hsp.score
                        res.e_value             = hsp.expect
                        res.sequence_match      = hsp.match
                        res.sequence_real       = hsp.sbjct
                        res.save()
            i+=1
    
    def get_prots_names(self,limit=50):
        #TODO : tenir compt des score des CalculatedPeptide
        res = []
        queryset = BlastCalculatedPeptide.objects.filter(blast=self).values("gi").annotate(score_avg=Avg("score")).annotate(count_gi=Count("gi")).annotate(score_max=Max("score")).annotate(score_min=Min("score")).annotate(count_pep_parent=Count("calculatedpeptide__analyse__pk",distinct=True)).annotate(count_pep=Count("calculatedpeptide__pk",distinct=True)).order_by("-count_pep_parent","-count_pep","-score")
        for u in queryset[:limit]:
            gi = BlastCalculatedPeptide.objects.filter(blast=self,gi=u["gi"])[0]
            res.append({"name": gi.__unicode__(),
                        "ajax-url" : gi.get_ajax_url(),
                        "score_avg":"%.2f" % u["score_avg"],
                        "score_max":"%.2f" % u["score_max"],
                        "score_min":"%.2f" % u["score_min"],
                        "count_gi":u["count_gi"],
                        "count_pep_parent":u["count_pep_parent"],
                        "count_pep":u["count_pep"],
                       })
        return res

    def get_prots_count(self):
        return BlastCalculatedPeptide.objects.filter(blast=self).values("gi").annotate(count=Count("gi")).count()

    def get_absolute_url(self):
        return reverse("kraggne-blast-detail",kwargs={"pk":self.id})

    def get_ajax_url(self):
        return reverse("ajax-blast-blast",kwargs={"pk":self.id})

    def can_blast(self):
        return not bool(self.fasta)


class BlastCalculatedPeptide(models.Model):
    blast               = models.ForeignKey(BlastAnalyse)
    calculatedpeptide   = models.ForeignKey(CalculatedPeptide)
    
    gi                  = models.IntegerField(_("NCBI id"))
    title               = models.TextField(_("Title"))
    score               = models.FloatField(_("score"))
    e_value             = models.FloatField(_("E value"))
    sequence_match      = models.TextField(_("matching sequence"))
    sequence_real       = models.TextField(_("real sequence"))

    def __unicode__(self):
        return u"%s" % self.title

    def get_ajax_url(self):
        return reverse("ajax-blast-pep",kwargs={"pk":self.id})


