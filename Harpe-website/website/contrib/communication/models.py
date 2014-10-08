# -*- coding: utf-8 -*-

from django.db import models
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _

from website.models import AnalysePeptide

class ClientCalculation(models.Model):
    STATES  = [(1,u"Envoyé"),(2,u"Reçu"),(3,u"Déconnecté")]

    client          = models.ForeignKey("Client")
    analysepeptide  = models.ForeignKey(AnalysePeptide)
    status          = models.IntegerField(_("Status"),choices=STATES)
    send_hour      = models.DateTimeField(_("Envoyé à"))
    recive_hour    = models.DateTimeField(_("Reçu à"))

    def analyse_status(self):
        if self.analysepeptide:
            return self.analysepeptide.get_status_display()
        return None

class Client(models.Model):
    ip         = models.IPAddressField(_("IP"))
    port       = models.IntegerField(_("port"))
    owner      = models.ForeignKey(User,blank=True,null=True)
    server     = models.ForeignKey("HarpeServer",null=False,blank=False)
    is_active  = models.BooleanField(_("is active"),default=False)
    data_send  = models.ManyToManyField(AnalysePeptide,through=ClientCalculation)

    ram        = models.IntegerField(_("Ram"),blank=True)
    version    = models.IntegerField(_("Version"),blank=True)


    def __unicode__(self):
        return "%s:%d" % (self.ip,self.port)

class HarpeServer(models.Model):
    name       = models.CharField(_("Name"),max_length=255,unique=True)
    ip         = models.IPAddressField(_("IP"))
    port       = models.IntegerField(_("port"))
    is_active  = models.BooleanField(_("is active"),default=False)
    version    = models.IntegerField(_("version"))#major*100*10 + minor * 10 + patch
    class FUNCTION_ID:
        GET_VERSION=1
        ANALYSE=2
        CLIENT_WAIT_FOR_WORK=3
        SEND_PEPTIDE_RESULTS=4
        SEND_CLIENT_CONFIG=5
        RESTART=6


    def get_version(self):
        major = self.version / (100*100)
        minor = self.version / 100 - major*100
        patch = self.version - (minor + major*100)*100
        return (major, minor,patch)


    @property
    def client_active(self):
        return Client.objects.filter(is_active=True,server=self.pk)

    def __unicode__(self):
        return u"%s" % self.name

    def disconnect(self):
        from website.contrib.communication.utils import Socket
        sock = Socket(Socket.Dommaine.IP,Socket.Type.TCP)
        sock.connect(self.ip,self.port)
        print "restart %s" % self
        if sock.verify_connexion() == sock.NTW_ERROR_NO:
            print "send restarting signal to %s" % self
            sock.call('i',HarpeServer.FUNCTION_ID.RESTART)

    #check activity
