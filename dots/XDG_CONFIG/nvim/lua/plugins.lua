-- plugins.lua
-- Using Packer
-- Bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Plugins
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- call packer itself first so it doesn't try to delete itself
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- LSP
	use  'williamboman/nvim-lsp-installer'
	use  'neovim/nvim-lspconfig'
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
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }

  -- telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} } }

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- bufferline
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
