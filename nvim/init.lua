-- init.lua
require('keybindings')
require('plugins')
require('config')

if vim.loop.os_uname().sysname == 'Linux' then
  print('Linux')
end

