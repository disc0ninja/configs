-- init.lua
require('keybindings')
require('plugins')
require('config')
if vim.loop.os_uname().sysname == 'Linux' then
  print('Linux')
end

local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc' -- LSP completion

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
