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
  use  'phha/zenburn.nvim'
  use  'luisiacc/gruvbox-baby'
  use 'savq/melange'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
