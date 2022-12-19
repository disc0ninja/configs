-- config.lua
vim.opt.scrolloff = 8

--{ "CursorMoved", "*", ':exec "norm zz"' }
vim.api.nvim_create_autocmd(
  {"CursorMoved"},
  {pattern = {"*"}, command = ':exec "norm zz"'}
)

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Files
vim.opt.encoding = 'utf-8'
vim.opt.autoindent = true
vim.cmd([[syntax on]])
vim.cmd([[set number]])
vim.cmd([[set relativenumber]])

-- Tabs
vim.opt.expandtab = true -- converts tabs to spaces
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- LSP Do this early! or auto attach won't work
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
  'ansiblels',
  'bashls',
  'gopls',
  'marksman',
  'pyright',
  'sumneko_lua',
  'terraformls',
  'yamlls',
})
lsp.nvim_workspace()
lsp.setup()

-- Treesitter
local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = { 'python', 'bash', 'yaml', 'lua' },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}

-- auto pairs
local npairs = require('nvim-autopairs')
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
require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
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
    diagnostics = true,
    separator_style = 'thin',
  }
}

-- indent-line
vim.opt.list = true
vim.opt.listchars:append 'space: '
vim.opt.listchars:append 'eol:↴'
vim.cmd [[highlight IndentBlanklineIndent guifg=#374147 gui=nocombine]]
--vim.g.indent_blankline_use_treesitter = true

require('indent_blankline').setup {
    show_end_of_line = true,
    space_char_blankline = '.',
    char_highlight_list = {'IndentBlanklineIndent'},
    space_char_highlight_list = {'IndentBlanklineIndent'},
}

-- peek markdown previewer
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

-- Code folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 6

-- colorizer
require("colorizer").setup {
    filetypes = { "*" },
    user_default_options = {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = true, -- "Name" codes like Blue or blue
      RRGGBBAA = false, -- #RRGGBBAA hex codes
      AARRGGBB = false, -- 0xAARRGGBB hex codes
      rgb_fn = false, -- CSS rgb() and rgba() functions
      hsl_fn = false, -- CSS hsl() and hsla() functions
      css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- Available modes for `mode`: foreground, background,  virtualtext
      mode = "background", -- Set the display mode.
      -- Available methods are false / true / "normal" / "lsp" / "both"
      -- True is same as normal
      tailwind = false, -- Enable tailwind colors
      -- parsers can contain values used in |user_default_options|
      sass = { enable = false, parsers = { css }, }, -- Enable sass colors
      virtualtext = "■",
    },
    -- all the sub-options of filetypes apply to buftypes
    buftypes = {},
}
