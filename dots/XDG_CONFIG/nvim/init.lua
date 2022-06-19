-- init.lua
require('plugins')
require('colorschemes')
require('config')
require('keybindings')

if vim.loop.os_uname().sysname == 'Linux' then
  print('Linux')
end
