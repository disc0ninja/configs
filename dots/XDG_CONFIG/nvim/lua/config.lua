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
vim.opt.foldlevel = 1

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

require'lspconfig'.ansiblels.setup{
  filetypes = { "yaml", "yml" }
}
require'lspconfig'.bashls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.terraformls.setup{
  filetypes = { "terraform", "tf" }
}

-- LSP completion
-- use omnifunc
vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
vim.o.completeopt = "menuone,noinsert"
vim.api.nvim_command('inoremap <C-space> <C-x><C-o>')

local npairs = require("nvim-autopairs")

npairs.setup({
    map_cr = true,
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})

-- nvim-tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'location'},
    lualine_z = {'progress'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
 -- bufferline
require('bufferline').setup{
  options = {
    numbers = 'buffer_id',
    diagnostics = 'nvm_lsp',
    separator_style = 'thin',
  }
}

-- indent-line
vim.opt.list = true
vim.opt.listchars:append "space: "
vim.opt.listchars:append "eol:↴"
vim.cmd [[highlight IndentBlanklineIndent guifg=#374147 gui=nocombine]]
--vim.g.indent_blankline_use_treesitter = true

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = ".",
    char_highlight_list = {"IndentBlanklineIndent"},
    space_char_highlight_list = {"IndentBlanklineIndent"},
}

-- peek
-- default config:
require('peek').setup({
  auto_load = true,         -- whether to automatically load preview when entering another markdown buffer
  close_on_bdelete = true,  -- close preview window on buffer delete
  syntax = true,            -- enable syntax highlighting, affects performance
  theme = 'dark',           -- 'dark' or 'light'
  update_on_change = true,
  throttle_at = 200000, -- start throttling when file exceeds this amount of bytes in size
  throttle_time = 5000  -- that has to pass before starting new render
})
vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})

-- gitsigns
require('gitsigns').setup()
