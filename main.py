#!/usr/bin/env python3
import sys
import os
import shutil
import json

def install_dots(dots_target):
    home = os.path.expanduser('~')
    with open(dots_target, 'r') as f:
        dot_files = json.load(f)
    for dot_file, dot_dest, in dot_files.items():
        dest = f'{home}{dot_dest[1:]}/{dot_file}'
        print(dot_file, dot_dest)
        if os.path.exists(dest):
            print(f'{dest} exists. Making a backup at {dest}.bak before proceeding')
            shutil.copy2(dest, f'{dest}.bak')
        print(dot_file, dest)
        shutil.copy2(dot_file, dest)

if sys.platform.startswith('linux'):
    print('Installing dotfiles for linux')
    install_dots('linux.json')
elif sys.platform.startswith('darwin'):
    print('Installing dotfiles for mac')
    install_dots('mac.json')
elif sys.platform.startswith('freebsd'):
    print('BSD')
#    install_dots('mac')
elif sys.platform.startswith('cygwin') or sys.platform.startswith('win32'):
    print('windows')
#    install_dots(linux)
else:
    print(f'{sys.platform} is not currently supported')
