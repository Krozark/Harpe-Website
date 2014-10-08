# -*- coding: utf-8 -*-

from django.views.generic import ListView, TemplateView, DetailView
from website.views import JSONAjaxView
from website.contrib.communication.models import *

def get_ip_from_request(request):
    client_address = None
    try:
        client_address = request.META['HTTP_X_FORWARDED_FOR']
    except:
    # case localhost ou 127.0.0.1
        client_address = request.META['REMOTE_ADDR']
    return client_address


class RegisterServerAjaxView(JSONAjaxView):

    def get(self,request, *args, **kwargs):
        self.message = ""

        name = request.GET.get("name")
        if not name:
            self.error("No name set")
            self.data["status"] = 211
            return self.render_to_response(None,status=211)

        srv_port = int(request.GET.get("port"))
        if not srv_port:
            self.error("No port set")
            self.data["status"] = 212
            return self.render_to_response(None,status=212)

        srv_addr = get_ip_from_request(request)
        if not srv_addr:
            self.error("unknow ip")
            self.datas["status"] = 213
            return self.render_to_response(None,status=213)

        srv = HarpeServer.objects.filter(name=name,is_active=False)
        if not srv:
            self.error("no object find in db")
            self.data["status"] = 214
            return self.render_to_response(None,status=214)

        srv_version = int(request.GET.get('version',0))

        srv = srv[0]
        srv.is_active=True
        srv.ip = srv_addr
        srv.port = srv_port
        srv.version = srv_version
        srv.save()

        for u in srv.client_set.all():
            u.is_active = False
            u.save()

        return self.render_to_response(None)

    def post(self,request, *args, **kwargs):
        self.error("POST not accepted")
        return self.render_to_response(None)

class UnregisterServerAjaxView(JSONAjaxView):
   
    def get(self,request, *args, **kwargs):
        self.message = ""

        name = request.GET.get("name")
        if not name:
            self.error("No name set")
            self.data["status"] = 211
            return self.render_to_response(None,status=211)

        srv_port = int(request.GET.get("port"))
        if not srv_port:
            self.error("No port set")
            self.data["status"] = 212
            return self.render_to_response(None,status=212)

        srv_addr = get_ip_from_request(request)
        if not srv_addr:
            self.error("unknow ip")
            self.datas["status"] = 213
            return self.render_to_response(None,status=213)

        srv = HarpeServer.objects.filter(name=name,ip=srv_addr,port=srv_port,is_active=True)
        if not srv:
            self.error("no object find in db")
            self.data["status"] = 214
            return self.render_to_response(None,status=214)

        srv = srv[0]
        srv.is_active=False
        srv.save()

        for u in srv.client_set.all():
            u.is_active = False
            u.save()

        return self.render_to_response(None)

    def post(self,request, *args, **kwargs):
        self.error("POST not accepted")
        return self.render_to_response(None)

class GetServerAjaxView(JSONAjaxView):
    def get(self,request, *args, **kwargs):
        self.message = ""

        srv = HarpeServer.objects.filter(is_active=True)
        if not srv:
            self.error("no object find in db")
            self.data["status"] = 214
            return self.render_to_response(None,status=214)

        self.data = [] 
        for u in srv:
            self.data.append({
                "name" : u.name,
                "ip" : u.ip,
                "port" : u.port,
                "version" : u.version
            })

        return self.render_to_response(None)

    def post(self,request, *args, **kwargs):
        self.error("POST not accepted")
        return self.render_to_response(None)


