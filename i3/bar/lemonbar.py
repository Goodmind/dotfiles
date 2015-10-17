#!/usr/bin/env python

from mpd import MPDClient, CommandError
from string import Template
import subprocess
import time
import i3
import re
import os

bar = ''
c = MPDClient()
c.connect(host='localhost', port='6600')

def mpd():
    global bar
    global c

    track = c.currentsong()
    bar += '%{c}' + track['artist'] + ' - ' + track['title']

def ws():
    global bar
    workspaces = i3.get_workspaces()

    for workspace in workspaces:
        cmd = 'i3-msg workspace ' + workspace['name']
        bar += Template('%{F#ffffffff}%{B#ff3c3c3c}%{A:$cmd:}').substitute(cmd=cmd.replace(':', '\:'))

        if workspace['focused']:
            ws = Template('%{B#ff2c2c2c} $name ')
        else:
            ws = Template(' $name ')

        bar += ws.substitute(name=workspace['name']) + '%{B#ff3c3c3c}%{A}'

while True:
    time.sleep(0.2)
    
    bar = ''
    ws()
    mpd()
    print(bar, flush=True)
