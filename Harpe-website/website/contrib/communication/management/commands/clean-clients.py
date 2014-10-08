from django.core.management.base import BaseCommand, CommandError
from website.contrib.communication.models import Client

class Command(BaseCommand):

    def handle(self, *args, **options):
        print "Delete all usless clients"
        i = 0
        for u in Client.objects.filter(is_active=False,data_send=None):
            print "del %s" % u
            u.delete()
            i+=1
        print "Delete %d clients" % i

