# -*- coding: utf-8 -*-
# -*- coding: utf-8 -*-


from django.http import HttpResponseRedirect, HttpResponse
from django.template.context import RequestContext# Context
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.utils.translation import ugettext_lazy as _
from django.shortcuts import render_to_response
from django.core.urlresolvers import reverse_lazy
from django.utils import simplejson as json
from django.views.generic.edit import CreateView, FormView
from django.views.generic.base import TemplateResponseMixin, View
from django.utils.safestring import SafeString

from Kraggne.views import GenericViewContextMixin, GenericView, GenericDetailView, GenericFormView, GenericListView #, GenericListFormView, GenericDetailFormView
#from Kraggne.contrib.contentblocks.utils import model_to_modelform

from website.models import *
from website.forms import *
from website.utils import *

####################### MIXIN / Base class #######################"
class JSONResponseMixin(object):
    """
    A mixin that can be used to render a JSON response.
    """
    def __init__(self,*args,**kwargs):
        self.status = "ok"
        self.message = ""
        self.data = {}

    def error(self,msg):
        self.status = "error"
        self.message = msg
        return self.render_to_json_response()

    def render_to_json_response(self,**response_kwargs):
        """
        Returns a JSON response, transforming 'context' to make the payload.
        """
        return HttpResponse(
            self.convert_context_to_json(
                {"status" : self.status,
                 "message" : self.message,
                 "data" : self.data,
                }
            ),
            content_type='application/json',
            **response_kwargs
        )

    def convert_context_to_json(self, context):
        "Convert the context dictionary into a JSON object"
        # Note: This is *EXTREMELY* naive; in reality, you'll need
        # to do much more complex handling to ensure that arbitrary
        # objects -- such as Django model instances or querysets
        # -- can be serialized as JSON.
        return json.dumps(context)

class JSONAjaxView(JSONResponseMixin,View):
    def render_to_response(self, context, **response_kwargs):
        return self.render_to_json_response(**response_kwargs)

    def get(self,request, *args, **kwargs):
        self.error("get not accepted")
        return self.render_to_response(None)

    def post(self,request, *args, **kwargs):
        return self.render_to_response(None)


##################### LOGIN ####################################

ROOT_URL = "/"

def login_form(request):
    er=""
    creat=False
    # User already authenticated
    if request.user.is_authenticated():
        #return HttpResponseRedirect(reverse("website-profile"))
        return HttpResponseRedirect("/")
    # User as submitted form
    elif request.method == 'POST':
        if 'user' and 'pass' in request.POST:
            username = request.POST['user']
            password = request.POST['pass']
            user = authenticate(username=username, password=password)

            if user is not None:
                if user.is_active:
                    login(request, user)
                    #return HttpResponseRedirect(reverse("website-profile"))
                    return HttpResponseRedirect("/")
                else :
                    er="utilisateur pas pas actif"
            else :
                er="invalide login/pass"
        elif 'username' and 'password1' and 'password2' in request.POST:
            form = CreatUserForm(request.POST)
            creat=True
            if form.is_valid():
                user= form.save()
                user.backend='django.contrib.auth.backends.ModelBackend' 
                login (request, user)
                #return HttpResponseRedirect(reverse("website-profile"))
                return HttpResponseRedirect("/")
    if (not creat):
        form = CreatUserForm()

    return render_to_response("registration/login.html",{
            'FORM' : form,
            'ERROR' : er,
            },context_instance=RequestContext(request))

@login_required(login_url=reverse_lazy('website-login'))
def logout_form(request):
    logout(request)
    if 'next' in request.GET:
        return HttpResponseRedirect(request.GET['next'])
    return HttpResponseRedirect(ROOT_URL)

################## General ############################

class HomeView(GenericView):
    slug          = "accueil"
    template_name = "website/home.html"



####################### AA #########################

class Ajax_AAView(JSONAjaxView):
    def get(self,request, *args, **kwargs):
        return self.post(request,*args,**kwargs)

    def post(self,request, *args, **kwargs):
        data = request.GET.get("data")

        if data == "mass":
            seq = request.GET.get("seq")
            if not seq:
                return self.error("No sequence found")
            mass = 0
            for aa_code in seq:
                if aa_code == ' ':
                    continue
                aa = AA.objects.filter(code=aa_code)[:1]
                if not aa:
                    return self.error("Amino acid %s not found in DB" % aa_code)
                mass += aa[0].mass
            self.data.update({"mass":mass})

        return super(Ajax_AAView,self).post(request,*args,**kwargs)


#################" AnalyseMgf #########################
class AnalyseMgfListView(GenericListView):
    model       = AnalyseMgf
    slug        = "analyse-list"

    def get_queryset(self):
        return AnalyseMgf.objects.filter(owner=self.request.user)


class AnalyseMgfDetailView(GenericDetailView):
    model       = AnalyseMgf
    slug        = None

    def get_context_data(self,**kwargs):
        context = super(AnalyseMgfDetailView,self).get_context_data(**kwargs)
        if context["object"].owner != self.request.user:
            context["object"] = None

        return context

class AnalyseMgfDetailSpectrumView(GenericDetailView):
    model       = AnalyseMgf
    slug        = None
    template_name = "website/analysemgf/spectrum.html"

    def get_context_data(self,**kwargs):
        context = super(AnalyseMgfDetailSpectrumView,self).get_context_data(**kwargs)
        if context["object"].owner != self.request.user:
            context["object"] = None

        aas,mods = make_aas_and_mods()

        context["aas"] = aas
        context["mods"] = mods

        return context

    def get_template_names(self):
        return self.template_name

class Ajax_AnalyseMgfDetailView(JSONAjaxView):
    def get(self,request, *args, **kwargs):
        return self.post(request,*args,**kwargs)

    def post(self,request, *args, **kwargs):
        obj = AnalyseMgf.objects.filter(pk=kwargs["pk"])[:1]
        if not obj:
            return self.error("Analyse pk is not valid")
        obj = obj[0]

        if obj.owner != request.user:
            return self.error("Analyse pk is not valid")

        data = request.GET.get("data")

        if data == "table-list":
            self.set_table_list(obj)
        elif data == "overview":
            self.set_overview(obj)

        return super(Ajax_AnalyseMgfDetailView,self).post(request,*args,**kwargs)

    
    def set_table_list(self,obj):
        rows = []
        #aas,mods = make_aas_and_mods()

        for u in obj.analysepeptide_set.select_related("calculatedpeptide_set").all():
            count = u.calculatedpeptide_set.count()
            row = {}
            
            row["name"] = u.name
            if u.sequence_aa != "":
                row["sequence"] = u.sequence_aa #asSequence(aas,mods,u.sequence)
            else:
                row["sequence"] = "None"
            if u.score_max != "":
                row["score_max"] = u.score_max
            else:
                row["score_max"] = "-1"
            if u.score_min != "":
                row["score_min"] = u.score_min
            else:
                row["score_min"] = "-1"
            if u.mass != "":
                row["mass"] = "%.4f" % u.mass
            else:
                row["mass"] = "None"
            if u.mz != "":
                row["mz"] = "%.4f" % u.mz
            else:
                row["mz"] = "None"
            row["intensity"] = u.intensity
            row["charge"] = u.charge
            row["count"] = count
            row["status"] = u.get_status_display()
            row["url"] = u.get_absolute_url()
            row["status_nb"] = u.status
            rows.append(row)
        self.data.update({"rows":rows})

    def set_overview(self,obj):
        rows = []

        for u in obj.analysepeptide_set.select_related("calculatedpeptide_set").all():
            row = {}
            
            row["name"] = u.name
            row["mass"] = "%.4f" % u.mass
            row["mz"] = "%.4f" % u.mz
            row["intensity"] = u.intensity
            row["charge"] = u.charge
            row["url"] = u.get_ajax_url()
            row["vurl"] = u.get_absolute_url()
            row["status"] = u.get_status_display()
            rows.append(row)
        self.data.update({"rows":rows})


from website.contrib.communication.utils import send_AnalyseMgf_to_calc
class Ajax_AnalyseRecieverView(JSONAjaxView):

    def post(self,request, *args, **kwargs):
        obj = AnalyseMgf.objects.filter(pk=kwargs["pk"])[:1]
        if not obj:
            return self.error("Analyse pk is not valid")

        obj = obj[0]

        if obj.owner != request.user:
            return self.error("Analyse pk is not valid")

        size = send_AnalyseMgf_to_calc(obj)
        if size <=0 : 
            return self.error("Impossible to send calculation to server.")
        self.data.update({"size":size})

        return super(Ajax_AnalyseRecieverView,self).post(request,*args,**kwargs)

#class AnalyseMgfAnalyse(GenericDetailView):
#    model       = AnalyseMgf
#    slug        = "analyse-analyse"
#
#    def get_context_data(self,**kwargs):
#        context = super(AnalyseMgfAnalyse,self).get_context_data(**kwargs)
#        if context["object"].owner != self.request.user:
#            context["object"] = None
#
#        return context

class AnalyseMgfCreateView(GenericFormView):
    slug          = "analyse-create"
    form_class    = AnalyseMgfForm

######################## CalculatedPeptide ########################

MH = 1.00794 #< Mass of Hydrogen in Da
MO = 15.99943 #< mass of carbon in Da
MH2O = (MO + 2*MH) #< mass of H2O if Da

class AnalysePeptideDetailView(GenericDetailView):
    model       = AnalysePeptide
    slug        = None

    def get_context_data(self,**kwargs):
        context = super(AnalysePeptideDetailView,self).get_context_data(**kwargs)
        if context["object"].analyse.owner != self.request.user:
            context["object"] = None
        return context

class Ajax_AnalysePeptideDetailView(JSONAjaxView):
    def get(self,request, *args, **kwargs):
        return self.post(request,*args,**kwargs)

    def post(self,request, *args, **kwargs):
        obj = AnalysePeptide.objects.filter(pk=kwargs["pk"])[:1]
        if not obj:
            return self.error("Peptide pk is not valid")
        obj = obj[0]

        if obj.analyse.owner != request.user:
            return self.error("Peptide pk is not valid")

        data = request.GET.get("data")

        if data == "msms":
            self.set_msms(obj)

        return super(Ajax_AnalysePeptideDetailView,self).post(request,*args,**kwargs)

    def set_msms(self,obj):
        rows = []
        rows.append({"mass" : 0,"mz" : 0,"intensity" : 10000,"charge" : -1}) #begin
        #rows.append({"mass" : MH2O,"mz" : MH2O,"intensity" : 10000,"charge" : -1}) #begin H2O

        for line in obj.mgf_part.split('\n'):
            datas = line.split('\t')
            if len(datas) ==  3:
                try:
                    mz = float(datas[0])
                    intensity = float(datas[1])
                    charge = int(datas[2].replace("+","").replace("-",""))
                    row = {}
                    row["mass"] = mz * charge - charge * MH
                    row["mz"] = mz
                    row["intensity"] = intensity
                    row["charge"] = charge
                    rows.append(row)
                except ValueError:
                    pass
        #rows.append({"mass" : obj.mass - MH2O,"mz" : obj.mass - MH2O,"intensity" : 10000,"charge" : -1}) #end H20
        rows.append({"mass" : obj.mass,"mz" : obj.mass,"intensity" : 10000,"charge" : -1}) #end
        self.data.update({"rows":rows})

        aas,mods = make_aas_and_mods()
        sequences = []
        for u in obj.calculatedpeptide_set.all():
            sequence = {}
            sequence["sequence_AA"], sequence["sequence"] = asSequence_AA(aas,mods,u.sequence)
            sequence["score"] = u.score
            sequence["pk"] = u.pk
            sequences.append(sequence)
        self.data.update({"sequences":sequences})


class CreateBlastView(GenericFormView):
    form_class = CreateBlastForm
    slug = "blast-create"

    def form_valid(self,form):
        self.success_url = form.cleaned_data["analyse"].get_absolute_url()
        res = super(GenericFormView,self).form_valid(form)
        obj = BlastAnalyse()
        for column,value in form.cleaned_data.items():
            setattr(obj,column,value)
        obj.save()
        return res

    def get_form_kwargs(self):
        #for initials datas
        kwargs = super(GenericFormView,self).get_form_kwargs()
        ana = self.request.GET.get("ana",None)
        kwargs.update({'user':self.request.user,
                       'ana' : ana,
                      })

        return kwargs

class Ajax_BlastRecieverView(JSONAjaxView):
    def get(self,request, *args, **kwargs):
        return self.post(request,*args,**kwargs)

    def post(self,request, *args, **kwargs):
        obj = BlastAnalyse.objects.filter(pk=kwargs["pk"])[:1]
        if not obj:
            return self.error("Blast pk is not valid")
        obj = obj[0]

        if obj.analyse.owner != request.user:
            return self.error("Blast pk is not valid")

        data = request.GET.get("data")
        if data=="do-blast":
            return self.do_blast(obj,request,*args,**kwargs)
        if data == "table-list":
            return self.do_table_list(obj,request,*args,**kwargs)
        return self.error("data arg is not valid")


    def do_blast(self,obj,request,*args,**kwargs):

        if not obj.can_blast():
            return self.error("Object have been blasted")

        obj.blast()

        #import threading

        #t = threading.Thread(target=BlastAnalyse.blast,
        #                             args=(obj,))
        #                             #kwargs=kwargs)
        #t.setDaemon(True)
        #t.start()
        return super(Ajax_BlastRecieverView,self).post(request,*args,**kwargs)

    def do_table_list(self,obj,request,*args,**kwargs):
        self.data.update({"rows":obj.get_prots_names()})
        return super(Ajax_BlastRecieverView,self).post(request,*args,**kwargs)


class Ajax_BlastPepRecieverView(JSONAjaxView):
    def get(self,request, *args, **kwargs):
        return self.post(request,*args,**kwargs)

    def post(self,request, *args, **kwargs):
        obj = BlastCalculatedPeptide.objects.filter(pk=kwargs["pk"])[:1]
        if not obj:
            return self.error("Blast pk is not valid")
        obj = obj[0]

        data = request.GET.get("data")

        if data == "prot-list":
            l = BlastCalculatedPeptide.objects.filter(blast=obj.blast,gi=obj.gi).order_by("calculatedpeptide__analyse__pk","calculatedpeptide__pk","-score")
            #l = BlastCalculatedPeptide.objects.filter(blast=obj.blast,gi=obj.gi).order_by("-score")
            rows = []
            for u in l:
                rows.append({
                    "cal_pk" : u.calculatedpeptide.pk,
                    "ana_pk" : u.calculatedpeptide.analyse.pk,
                    "ana_name" : u.calculatedpeptide.analyse.__unicode__(),
                    "score" : u.score,
                    "e_value" : u.e_value,
                    "sequence_match" : SafeString(u.sequence_match),
                    "sequence_real" : SafeString(u.sequence_real),
                    "sequence_aa" : u.calculatedpeptide.sequence_aa,
                    "cal_url" : u.calculatedpeptide.get_absolute_url(),
                    "ana_url" : u.calculatedpeptide.analyse.get_absolute_url(),
                })
            self.data.update({"rows":rows})
        else:
            return self.error("unknow value %s for param data" % data)

        return super(Ajax_BlastPepRecieverView,self).post(request,*args,**kwargs)



