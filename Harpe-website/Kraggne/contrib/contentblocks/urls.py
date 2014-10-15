# -*- coding: utf-8 -*-

#~ in django 1.5 
#~ from django.conf.urls.defaults import patterns, url #,include
#~ for django 1.6
from django.conf.urls import patterns, url #,include
from Kraggne.contrib.contentblocks.views import AjaxRecieverView

urlpatterns = patterns('',
    url(r'^ajax-receiver',AjaxRecieverView.as_view(),name="ajax-receiver"),
)

