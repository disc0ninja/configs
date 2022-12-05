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
	use { 'wbthomason/packer.nvim' } -- call packer itself first so it doesn't try to delete itself
  -- use {'williamboman/nvim-lsp-installer'}

	-- LSP
  use { 'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  use { 'nvim-treesitter/nvim-treesitter' } -- Treesitter
  use { 'JoosepAlviste/palenightfall.nvim'} -- Theme
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup { map_cr = true } end, } -- autopairs
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } } --nvim-tree
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} } } --telescope
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } } -- lualine
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'nvim-tree/nvim-web-devicons'} --bufferline
  use { 'lukas-reineke/indent-blankline.nvim' } -- indent line
  use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' } -- markdown previewer
  use { 'lewis6991/gitsigns.nvim', tag = 'v0.5' } -- git signs
  use { 'fladson/vim-kitty' } -- kitty config syntax

	if packer_bootstrap then
		require('packer').sync()
	end
end)
