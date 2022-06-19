-- plugins.lua
-- Using Packer
-- Bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Plugins
require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- call packer itself first so it doesn't try to delete itself
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use {
          {
              "williamboman/nvim-lsp-installer",
              require("nvim-lsp-installer").setup {}
          },
          {
              "neovim/nvim-lspconfig",
              after = "nvim-lsp-installer",
              require'lspconfig'.sumneko_lua.setup{},
              require'lspconfig'.gopls.setup{}
          }
        }
	if packer_bootstrap then -- this should be at the end 
		require('packer').sync()
	end
end)
