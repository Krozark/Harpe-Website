# -*- coding: utf-8 -*-

from django.template import Library, Node, TemplateSyntaxError, TemplateDoesNotExist, Variable
from django.template.loader import select_template, get_template
from Kraggne.contrib.flatblocks.templatetags.flatblocks import next_bit_for, resolve
from website.models import AA, AnalyseMgf, AAModification
from website.contrib.communication.models import HarpeServer


register = Library()


@register.filter
def as_percentage_of(part, whole):
    try:
        return "%.2f" % (float(part) / whole * 100)
    except (ValueError, ZeroDivisionError):
        return ""

class AsSequenceNode(Node):
    
    def __init__(self,peak_aa_list):
        self.peak_list = peak_aa_list

    def render(self,context):
        l = resolve(self.peak_list,context)
        res = ""
        aa_seq = ""
        is_peak = True
        mods = {0:"",}
        for u in l:
            if is_peak:
                res +="<span class=\"peak\">"+u
            else:
                aa_pk,mod_pk = u.split(":")
                aa= AA.objects.filter(pk=aa_pk)[:1]

                if not mods.get(mod_pk):
                    mods[mod_pk] = ""
                    try:
                        mods[mod_pk] = AAModification.objects.get(pk=mod_pk)
                    except:
                        pass
                if aa:
                    if mods.get(mod_pk):
                        res+="<span class=\"aa modified\" title=\"%s\">" % mods[mod_pk].__print__(aa[0])
                    else:
                        res+="<span class=\"aa\">"
                    aa_seq += "%s" % aa[0].code
                    res+=aa[0].code
                else:
                    res+="ERROR"
            res+="</span>"
            is_peak = not is_peak
        res = "<div class=\"sequence\"><span class=\"aa_seq\">%s</span>%s</div>" % (aa_seq,res)
        return res

def do_AsSequence(parser,token):
    bits = token.contents.split()
    obj = next_bit_for(bits,"aa_sequence")
    return AsSequenceNode(obj)
register.tag('aa_sequence',do_AsSequence)

@register.filter
def get_last_analyses(user):
    if user.is_authenticated():
        return AnalyseMgf.objects.filter(owner=user.pk).order_by('-created')[:10]
    return []

class GetServerNode(Node):
    def __init__(self,variable):
        self.variable = variable

    def render(self,context):
        var_name = resolve(self.variable,context)
        context[var_name] = HarpeServer.objects.all().order_by('-is_active')
        return ""

def do_get_server(parser,token):
    bits = token.contents.split()
    var_name = next_bit_for(bits,'as')
    return GetServerNode(var_name)
register.tag('get_servers',do_get_server)

