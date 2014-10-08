from django.core.management.base import BaseCommand, CommandError
from website.contrib.communication.utils import Socket, create_socket
from website.contrib.communication.models import HarpeServer

class Command(BaseCommand):

    def handle(self, *args, **options):
        sock = create_socket()
        if not sock:
            return
        print "Ready"
        print "Call function with id 1 (get version)"
        print sock.call('i',HarpeServer.FUNCTION_ID.GET_VERSION)

