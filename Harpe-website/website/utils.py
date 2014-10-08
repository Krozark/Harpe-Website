# -*- coding: utf-8 -*-

from website.models import AA, AAModification

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'


def make_aas_and_mods():
    aas = {}
    for u in AA.objects.all():
        aas.update({u.pk:u})

    mods = {}
    for u in AAModification.objects.all():
        mods.update({u.pk:u})

    return aas,mods

def asSequence(aas,mods,sequence):
    seq = sequence.split(',')
    res = ""
    is_peak = True
    seq_aa = ""
    for u in seq:
        if is_peak:
            res +="<span class=\"peak\">%s</span>" % u
        else:
            aa_pk,mod_pk = u.split(':')
            mod = mods.get(int(mod_pk))
            aa = aas[int(aa_pk)]
            seq_aa += "-%s" % aa.slug
            if mod:
                res+="<span class=\"aa modified\" title=\"%s\">%s</span>" % (mod.__print__(aa),aa.slug)
            else:
                res+="<span class=\"aa\">%s</span>" % aa.slug
        is_peak = not is_peak
    return "<span class=\"aa_seq\">%s</span>%s" % (seq_aa,res)

def asSequence_AA(aas,mods,sequence):
    seq = sequence.split(',')
    res_aa = ""
    res_seq = ""
    is_peak = True
    i,size = 0,len(seq)
    while i < size and size > 1:
        u = seq[i]
        if is_peak:
            res_seq +="%.4f" % float(u)
            if i+1 < size:
                res_seq +="-"
        else:
            aa_pk,mod_pk = u.split(':')
            mod = mods.get(int(mod_pk))
            aa = aas[int(aa_pk)]
            
            a = ""
            if mod:
                a+="%s" % mod.__print__(aa)
            else:
                a+="%s" % aa.code

            res_aa+=a
            if i+2 < size:
                res_aa+=" - "

            res_seq +=a+"-"

        is_peak = not is_peak
        i+=1
    return res_aa,res_seq

