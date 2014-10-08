# -*- coding: utf-8 -*-

from django.conf import settings
from django.contrib import admin
#from django.utils.translation import ugettext_lazy as _
#from webcore.utils.admin import AdminThumbnailMixin
#from grappellifit.admin import TranslationAdmin
from website.contrib.communication.models import *


class ClientCalculationAdmin(admin.ModelAdmin):
    list_display    = ("client","analysepeptide","status","send_hour","recive_hour","analyse_status")
admin.site.register(ClientCalculation,ClientCalculationAdmin)

class ClientAdmin(admin.ModelAdmin):
    list_display    = ("ip","port","owner","server","is_active","ram","version")
    list_filter     = ("is_active",)
admin.site.register(Client,ClientAdmin)

class HarpeServerAdmin(admin.ModelAdmin):
    list_display    = ("name","version","ip","port","is_active")
    #list_editable   = ("is_active")
admin.site.register(HarpeServer,HarpeServerAdmin)
