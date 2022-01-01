# config.py

import os

class Config:

    def __init__(self,name, src, dest):
        self.src = src
        self.name = name
        self.dest = dest

    def backup_existing(self):
       print(F'\n\nAttempting to make a backup of {self.name}')
       if os.path.exists(self.dest):
           os.system(
                   F'cp {self.dest} {self.dest}.bak'
           )
           print(F'Backup created at {self.dest}.bak')
       else:
           print(F'Nothing to backup at:\n{self.dest}')

    def install(self):
       print(F'\n\nAttempting to install {self.name} to {self.dest}')
       if os.path.exists(self.src):
           os.system(
                   F'cp {self.src} {self.dest}'
           )
           print(F'{self.name} installed to {self.dest}')
       else:
           print(F'Nothing to install')

    def revert(self):
        # restore the last backup copy if it exists
       print(F'\n\nChecking for backup to revert to')
       if os.path.exists(F'{self.dest}.bak'):
           print(F'Attempting to revert {self.name} from backup')
           os.system(
                   F'cp {self.dest}.bak {self.dest}'
           )
           print(F'{self.name} reverted successfully')
       else:
           print(F'No backup found. Unable to revert')
