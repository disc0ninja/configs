-- plugins.lua
-- Using Packer
-- Bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data' .. '/site/pack/packer/start/packer.nvim')
if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Plugins
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- call packer itself first so it doesn't try to delete itself
  use 'nvim-treesitter/nvim-treesitter'

	-- LSP
	use 'williamboman/nvim-lsp-installer'
	use 'neovim/nvim-lspconfig'

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
