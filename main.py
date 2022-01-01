#!/usr/bin/python3

from config import Config

print('This program is designed to make it easy to install\
      \nconsistent configurations across multiple environments.\
      \nIt comes with absolutely no warranty to the extent permitted\
      \nby law')

print('\nWhat would you like to do?\n\
        (1) Install a config\n\
        (2) Create a backup of a config\n\
        (3) Revert a config\n\
        (4) Exit without making any changes\n')

ans = int(input('Please enter a number\n'))
if ans == 1:
    # Install a config
    pass
elif ans == 2:
    # Create a backup of a config
    pass
elif ans == 3:
    # Revert a config
    pass
elif ans == 4:
    # Exit
    print('\nExiting without making any changes')
else:
    # Exit
    print('\nUnrecognized option. Exiting without making any changes')

def which_configs(action):
    case = int(input(F'\n\nWhich configs do you wish to {action}?\n'))a
    if case == 1:
        # action ALL configs
    elif case == 2:
        # action config kitty
    elif case == 3:
        # action config bash
    elif case == 4:
        # action config vim
    elif case == 5:
        # lynx
    elif case == 6:
        # xscreensaver
    elif case == 7:
        # X11 stuff


    

# t1 = Config('test', '/home/disc0ninja/configs/test', '/home/disc0ninja/configs/dest/test')
# t1.backup_existing()
# t1.install()
# t1.revert()

