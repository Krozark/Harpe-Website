# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url

from website.views import *

urlpatterns = patterns('',
       url(r'^', include('website.contrib.communication.urls')),
       url(r'^$', HomeView.as_view(),name="website-home"), 
       url(r'^login/$','website.views.login_form',name='website-login'),#base2#TODO
       url(r'^logout/$','website.views.logout_form',name='website-logout'),#redirect#TODO
        
        ##AA
        url(r"^aa/ajax/$",Ajax_AAView.as_view(),name="ajax-aa"),

       #analyse
       url(r'^analyses/list/$', AnalyseMgfListView.as_view(),name="analyse-list"), 
       url(r'^analyse/(?P<pk>[\d]+)/$', AnalyseMgfDetailView.as_view(),name="analyse-detail"), 
       url(r'^analyse/(?P<pk>[\d]+)/spectrum/$', AnalyseMgfDetailSpectrumView.as_view(),name="analyse-detail-spectrum"), 
       url(r'^analyse/(?P<pk>[\d]+).json$', Ajax_AnalyseMgfDetailView.as_view(),name="analyse-detail-ajax"), 
       url(r'^analyse/(?P<pk>[\d]+)/analyse/$', Ajax_AnalyseRecieverView.as_view(),name="analyse-analyse"), 
       url(r'^analyse/create/$', AnalyseMgfCreateView.as_view(),name="analyse-create"), 
       #peptide
       url(r'^peptide/(?P<pk>[\d]+)/$', AnalysePeptideDetailView.as_view(),name="peptide-detail"), 
       url(r'^peptide/(?P<pk>[\d]+).json$', Ajax_AnalysePeptideDetailView.as_view(),name="peptide-detail-ajax"),
       #blast
       url(r'^blast/$',CreateBlastView.as_view(),name="blast-create"),
       url(r'blast/(?P<pk>[\d]+)/blast/$',Ajax_BlastRecieverView.as_view(),name="ajax-blast-blast"),

       url(r'blast/prot/(?P<pk>[\d]+)/ajax/$',Ajax_BlastPepRecieverView.as_view(),name="ajax-blast-pep")
)
