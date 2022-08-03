-- config.lua

-- Files
vim.opt.encoding = 'utf-8'
vim.opt.autoindent = true
vim.cmd([[syntax on]])
vim.cmd([[set number relativenumber]])

-- Tabs
vim.opt.expandtab = true -- converts tabs to spaces
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- Treesitter
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

-- Code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- LSP
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

-- Required LSP Servers
require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
require'lspconfig'.ansiblels.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.gopls.setup{}

vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc' -- LSP completion
