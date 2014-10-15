# -*- coding: utf-8 -*-

#~ In django 1.5 
#~ from django.conf.urls.defaults import *
#~ for django 1.6
from django.conf.urls import *
#from django.conf import settings
from website.contrib.communication.views import *

urlpatterns=patterns('',
    url(r'^register/$', RegisterServerAjaxView.as_view(),name='communication-register'),
    url(r'^unregister/$', UnregisterServerAjaxView.as_view(),name='communication-unregister'),
    url(r'^get/$', GetServerAjaxView.as_view(),name='communication-get'),
)
