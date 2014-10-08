# -*- coding: utf-8 -*-
import socket as csocket
from struct import pack,unpack
from website.contrib.communication.models import *

def enum(**enums):
    return type('Enum', (), enums)

class Socket:
    Dommaine = enum(IP=csocket.AF_INET,LOCAL=csocket.AF_UNIX)
    Type = enum(TCP=csocket.SOCK_STREAM, UDP=csocket.SOCK_DGRAM)
    Down = enum(SEND=0,RECIVE=1,BOTH=2)

    NTW_WELCOM_MSG = "hello!\0"
    NTW_ERROR_NO = 0

    def __init__ (self,dommaine,type,protocole=0):
        self.sock = csocket.socket(dommaine,type,protocole)
        self.buffer = b""
        self.status = 0

    def connect(self,host,port):
        self.sock.connect((host,port))

    def verify_connexion(self):
        code = 404
        if self.receive() > 0:
            msg = self._unpack_str()
            if msg == self.NTW_WELCOM_MSG and self.status == self.NTW_ERROR_NO:
                print "verify_connexion <%d : %s>" % (self.status,msg)
            else:
                print "verify_connexion <%d : %s>" % (self.status,msg)
        self.clear()
        return self.status
    
    def _unpack_str(self):
        i = 0
        while self.buffer[i]!= '\0':
            i+=1
        i+=1
        res = self.buffer[:i]
        self.buffer = self.buffer[i:]
        return res

    def send(self):
        size = len(self.buffer)
        _size = pack('!Ih',size,self.status)
        data = _size + self.buffer
        sent = self.sock.send(data)
        if sent == 0:
            print "Connexion lost"
            return False
        return True

            
    def receive(self):
        recv = b''
        recv = self.sock.recv(6)
        if recv == b'':
            print "Connexion lost"
            return None
        size,self.status = unpack('!Ih',recv)
        self.buffer = self.sock.recv(size)
        return len(recv) + len(self.buffer)

#Format C Type 	            Python type 	    Standard size
#x  	pad byte 	        no value 	  	 
#c  	char 	            string of length    1
#b  	signed char 	    integer 	        1
#B  	unsigned char 	    integer 	        1
#?  	_Bool 	            bool 	            1
#h  	short 	            integer 	        2
#H  	unsigned short 	    integer 	        2
#i  	int 	            integer 	        4
#I  	unsigned int 	    integer 	        4
#l  	long 	            integer 	        4
#L  	unsigned long 	    integer 	        4
#q  	long long 	        integer 	        8
#Q  	unsigned long long 	integer 	        8
#f  	float 	            float 	            4 
#d  	double 	            float 	            8
#s  	char[] 	            string 	  	 
#p  	char[] 	            string 	  	 
#P  	void * 	            integer
    def add(self,typ,*args):
        self.buffer +=pack('!'+typ,*args)

    def clear(self):
        self.buffer = b""
        self.status = 0

    def call(self,ret_type,func_id,types="",*args):
        if len(types) < len(args):
            print "Wrong number of args/type"
            return 0

        self.clear()
        self.add("i",func_id)
        if types:
            self.add(types,*args)

        self.send()
        size = self.receive()
        if size:
            if self.status != 0:
                print "recive error code : %d" % self.status
            else:
                return unpack("!"+ret_type,self.buffer)[0]
        return 0


def create_socket():
    sock = Socket(Socket.Dommaine.IP,Socket.Type.TCP)
    ser = HarpeServer.objects.filter(is_active=True)[:1]
    if not ser:
        return False
    ser = ser[0]
    sock.connect(ser.ip,ser.port)
    if sock.verify_connexion() != sock.NTW_ERROR_NO:
        print "An error occur"
        return None
    return sock


def send_AnalyseMgf_to_calc(analyseMfg):
    sock = create_socket()
    if not sock:
        return False
    data = analyseMfg.mgf.read() + '\0'
    return sock.call("i",HarpeServer.FUNCTION_ID.ANALYSE,"i%ds" % (analyseMfg.mgf.size+1) ,analyseMfg.pk,data)

