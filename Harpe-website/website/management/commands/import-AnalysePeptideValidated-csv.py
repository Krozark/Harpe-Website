from django.core.management.base import BaseCommand, CommandError

from django.db.models import Q

from website.models import *
from website import logs

import csv
import ntpath
import os

class Command(BaseCommand):
    args = ['filename']
    help = 'import a csv file of ProteinPilot'

    def handle(self, *args, **options):
        if len(args)<1:
            raise CommandError("No filename specify")

        filename_path = args[0]
        if len(args) <3:
            filename = ntpath.basename(filename_path)
            filename = os.path.splitext(filename)[0]
        else:
            filename = argv[2]
        logs.note("use name %s as AnalyseMgf pk" % filename)
        analyse = AnalyseMgf.objects.get(name=filename)

        with open(filename_path,'r') as f:
            reader = csv.reader(f)
            h = reader.next()
            header = {}
            for i in range(0,len(h)):
                header[h[i]] = i
            
            j = 0
            for row in reader:
                j+=1
                if row[header["OK"]] == "true":
                    ok = True

                    seq = row[header["Sequence"]]
                    if not seq:
                        logs.error("Row %d don't have any sequence" % j)
                        continue
                    seq = seq.split(".")[1]
                    for a in seq:
                        aa = AA.objects.filter(code=a)[:1]
                        if not aa:
                            ok=False
                            logs.error("AA %s not find in DB" % a)
                            break

                    modifications = row[header["Modifications"]]
                    mod = modifications.split(":")[0]
                    if mod:
                        m = AAModification.objects.filter(name=mod)[:1]
                        if m:
                            mod = m[0]
                        else:
                            ok = False
                            logs.error("Modification %s not find in DB" % mod)
                            continue

                    cmpd = row[header["Cmpd."]]
                    score = row[header["Scores"]].split(" ")[0]
                    analyses = AnalysePeptide.objects.filter(analyse__pk=analyse.pk,cmpd=cmpd)
                    if not analyses:
                        ok = False
                        logs.error("No AnalysePeptide find with analyse.pk=%d and cmpd=%s" % (analyse.pk,cmpd))
                        continue

                    if len(analyses) > 1:
                        ok = False
                        logs.error("More than 1 analyse find with analyse.pk=%d and cmpd=%s" % (analyse.pk,cmpd))
                        continue

                    analyses = analyses[0]
                    if ok:
                        if AnalysePeptideValidated.objects.filter(analyse__pk=analyses.pk)[:1]:
                            logs.warning("A AnalysePeptideValidated already existe that refer to this cmpd (%s)" % cmpd)
                            continue
                        pep = AnalysePeptideValidated()
                        pep.score = float(score)
                        pep.analyse = analyses
                        pep.sequence = seq
                        pep.modification_seq = modifications
                        pep.save()
                        if mod:
                            pep.modifications.add(mod)
                        logs.note("Save row %d" % j)


