#!/usr/bin/python3

from config import Config

t1 = Config('test', '/home/disc0ninja/configs/test', '/home/disc0ninja/configs/dest/test')
t1.backup_existing()
t1.install()
t1.revert()

