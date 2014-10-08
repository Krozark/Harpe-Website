# -*- coding: utf-8 -*-

from django.contrib import admin
from website.models import *

############## ATOMS ######################
class AtomIsotopeAdminInline(admin.TabularInline):
    model = AtomIsotope
    extra = 1

class AtomAdmin(admin.ModelAdmin):
    list_display = ("name","slug","per_id")
    search_fields = ("name","slug")
    inlines = [ AtomIsotopeAdminInline,]
admin.site.register(Atom,AtomAdmin)

class AtomIsotopeAdmin(admin.ModelAdmin):
    list_display = ("atom","mass","frequence")
    search_fields = ("atom__name","atom__slug")
admin.site.register(AtomIsotope,AtomIsotopeAdmin)


############ AMINO ACIDS #####################

class AATypeAdmin(admin.ModelAdmin):
    list_display = ("name",)
admin.site.register(AAType,AATypeAdmin)

class AAAdmin(admin.ModelAdmin):
    list_display = ("name","slug","code","mass","formule","type","fk_aa","fk_mod")
    search_fields = ("name","slug")
    prepopulated_fields = {'slug':('name',)}
admin.site.register(AA,AAAdmin)


################# PTM ############################

class ModTypeAdmin(admin.ModelAdmin):
    list_display = ("name",)
admin.site.register(ModType,ModTypeAdmin)

class AAModificationPositionAdmin(admin.ModelAdmin):
    list_display    =   ("AA","modification","position")
    search_fields   =   ("AA",)
    list_filter     =   ("AA","position")
admin.site.register(AAModificationPosition,AAModificationPositionAdmin)

class AAModificationPositionAdminInline(admin.TabularInline):
    model = AAModificationPosition
    extra = 4

class AAModificationAdmin(admin.ModelAdmin):
    list_display = ("name","slug","type","TS","delta","get_AAs")
    search_fields = ("name",)
    list_filter  = ("type","AAs","TS")
    inlines = [
        AAModificationPositionAdminInline,
    ]
admin.site.register(AAModification,AAModificationAdmin)


class ImpossibleCutAdmin(admin.ModelAdmin):
    list_display = ("first","second")
    search_fields = ("first","second")
    list_filter = ("first","second")
admin.site.register(ImpossibleCut,ImpossibleCutAdmin)

class EnzymeAdmin(admin.ModelAdmin):
    list_display = ("name",)
    search_fields = ("name",)
    filter_horizontal = ("cut_before","cut_after","cut_imposible")
admin.site.register(Enzyme,EnzymeAdmin)


class AnalyseMgfAdmin(admin.ModelAdmin):
    list_display = ("name","owner","created","mgf","max_charge","error")
    search_fields  = ("name","owner")
    filter_horizontal = ("AAs","modifications")
admin.site.register(AnalyseMgf,AnalyseMgfAdmin)

class AnalysePeptideAdmin(admin.ModelAdmin):
    list_display    = ('analyse','name',"mz","charge","mass","intensity","status")
    search_fields     = ('analyse','name')
    list_filter     = ('status',)
admin.site.register(AnalysePeptide,AnalysePeptideAdmin)

class AnalysePeptideValidatedAdmin(admin.ModelAdmin):
    list_display = ("analyse","score","sequence","modification_seq")
    search_fields = ("analyse__name",)
    list_filter = ("analyse__analyse",)
admin.site.register(AnalysePeptideValidated,AnalysePeptideValidatedAdmin)

class CalculatedPeptideAdmin(admin.ModelAdmin):
    list_display    = ('analyse','score')
    search_fields     = ('analyse','sequence')
admin.site.register(CalculatedPeptide,CalculatedPeptideAdmin)

class BlastAnalyseAdmin(admin.ModelAdmin):
    list_display    = ("analyse","database","program","xml")
admin.site.register(BlastAnalyse,BlastAnalyseAdmin)

class BlastCalculatedPeptideAdmin(admin.ModelAdmin):
    list_display    = ("title","gi","score","e_value","sequence_match","sequence_real","blast","calculatedpeptide")
admin.site.register(BlastCalculatedPeptide,BlastCalculatedPeptideAdmin)
