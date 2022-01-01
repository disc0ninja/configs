#!/usr/bin/python3

# config imports
import sys
import os

class config:

    def __init__(self,name, src, dest):
        self.src = src
        self.name = name
        self.dest = dest


    def backup_existing(self):
       print(F"Attempting to make a backup of {self.name}\n")
       if os.path.exists(self.dest):
           os.system(
                   F"cp {self.dest} {self.dest}.bak"
           )
           print(F"Backup created at {self.dest}.bak\n")
       else:
           print(F"Nothing to backup at:\n{self.dest}.\n\nMoving on..\n\n")

    
    def install(self):
       print(F"Attempting to install {self.name} to {self.dest}\n")
       if os.path.exists(self.src):
           os.system(
                   F"cp {self.src} {self.dest}"
           )
           print(F"{self.name} installed to {self.dest}\n")
       else:
           print(F"Nothing to install\n")


    def revert(self):
        # restore the last backup copy if it exists
        pass



t1 = config('test', '/home/disc0ninja/configs/test', '/home/disc0ninja/configs/dest/test')
t1.backup_existing()
t1.install()

