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
       print(F"Attempting to make a backup of {self.name}")
       if os.path.exists(self.dest):
           os.system(
                   F"cp {self.dest} {self.dest}.bak"
           )
       else:
           print(F"Nothing to backup at:\n{self.dest}.\n\nMoving on..\n\n")
           
    
    def install(self):
        # place a hard link from self in dest
        pass

    def revert(self):
        # restore the last backup copy if it exists
        pass



t1 = config('test', '/home/disc0ninja/configs/test', '/home/disc0ninja/configs/dest/test')
t1.backup_existing()
