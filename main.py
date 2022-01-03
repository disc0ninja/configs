#!/usr/bin/python3
import os

home = os.path.expanduser('~')

from config import Config

kitty = Config('kitty', './kitty', F'{home}/.config/kitty')
bash = Config('bash', '.bashrc', F'{home}/.bashrc')
vim = Config('vim', '.vimrc', F'{home}/.vimrc')
xscreensaver = Config('xscreensaver', '.xscreensaver', F'{home}/.xscreensaver')

def select_operation():

    print('This program is designed to make it easy to install\
        \nconsistent configurations across multiple environments.\
        \nIt comes with absolutely no warranty to the extent permitted\
        \nby law')

    print('\nWhat would you like to do?\n\
        (1) Install a config\n\
        (2) Create a backup of a config\n\
        (3) Revert a config\n\
        (4) Exit without making any changes\n')

    case = int(input('Please enter a number\n'))

    if case == 1:
        # Install a config
        select_configs('install()')
    elif case == 2:
        # Create a backup of a config
        select_configs('backup_existing()')
    elif case == 3:
        # Revert a config
        select_configs('revert()')
    elif case == 4:
        # Exit
        print('\nExiting without making any changes')
    else:
        # Exit
        print('\nUnrecognized option. Exiting without making any changes')

def select_configs(operation):

    print(F'\nWhich configs would you like to {operation}?\n\
        (1) All\n\
        (2) Kitty\n\
        (3) bash\n\
        (4) vim\n\
        (5) xscreensaver\n\
        (0) Exit without making any changes\n\
        ')

    case = int(input('Please enter a number\n'))

    if case == 1:
        # operation ALL configs
        all_configs = ['kitty', 'bash', 'vim', 'xscreensaver',]
        for i in all_configs:
            cmd = F'{i}.{operation}'
            exec(cmd)
    elif case == 2:
        # operation config kitty
        cmd = F'kitty.{operation}'
        exec(cmd)
    elif case == 3:
        # operation config bash
        cmd = F'bash.{operation}'
        exec(cmd)
    elif case == 4:
        # operation config vim
        cmd = F'vim.{operation}'
        exec(cmd)
    elif case == 5:
        # operation config xscreensaver
        cmd = F'xscreensaver.{operation}'
        exec(cmd)
    elif case == 0:
        print('Exiting without making any changes')



select_operation()   
