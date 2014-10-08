# -*- coding: utf-8 -*-

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'

def note(*args):
    res = bcolors.OKBLUE
    for u in args:
        res+=u
    res+= bcolors.ENDC
    print res

def ok(*args):
    res = bcolors.OKGREEN
    for u in args:
        res+=u
    res+= bcolors.ENDC
    print res

def warning(*args):
    res = bcolors.WARNING
    for u in args:
        res+=u
    res+= bcolors.ENDC
    print res

def error(*args):
    res = bcolors.FAIL
    for u in args:
        res+=u
    res+= bcolors.ENDC
    print res
