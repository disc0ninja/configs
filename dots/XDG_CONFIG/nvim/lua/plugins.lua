-- plugins.lua
-- Using Packer
-- Bootstrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Plugins
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- call packer itself first so it doesn't try to delete itself
  use 'nvim-treesitter/nvim-treesitter'

	-- LSP
	use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Visual - Themes/Colorschemes
  use 'phha/zenburn.nvim'
  use 'luisiacc/gruvbox-baby'
  use 'savq/melange'
  use 'patstockwell/vim-monokai-tasty'
  use 'jacoborus/tender.vim'
  use 'navarasu/onedark.nvim'
  use 'JoosepAlviste/palenightfall.nvim'

  -- auto-pairing
  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {
      map_cr = true
    } end,
  }

  -- nvim-tree
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }

  -- telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} } }

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- bufferline
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- indent-line
  use 'lukas-reineke/indent-blankline.nvim'
  
  -- peek markdown previewer
  use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }

  -- git signs
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'v0.5'
  }

  -- kitty config syntax
  use { 'fladson/vim-kitty' }

	if packer_bootstrap then
		require('packer').sync()
	end
end)
