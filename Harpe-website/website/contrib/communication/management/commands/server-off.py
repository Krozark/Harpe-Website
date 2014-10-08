from django.core.management.base import BaseCommand, CommandError
from website.contrib.communication.models import HarpeServer

class Command(BaseCommand):

    def handle(self, *args, **options):
        print "Set all server to disconnect"
        for u in HarpeServer.objects.all():
            print "Set off %s" % u
            if u.is_active:
                u.is_active = False
                u.save()
                u.disconnect()

