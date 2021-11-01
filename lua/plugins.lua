vim.cmd[[ packadd packer.nvim ]]

require('packer').startup(function(use)
  use 'ray-x/go.nvim'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' 
  use 'kosayoda/nvim-lightbulb'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'tpope/vim-rhubarb' 
  use { "folke/twilight.nvim" }
  use {'hrsh7th/nvim-cmp' }
  use {'hrsh7th/cmp-nvim-lsp'}
  use { 'chriskempson/base16-vim' }
  use { 'mattn/emmet-vim' }
  use { 'overcache/NeoSolarized' }
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'tjdevries/nlua.nvim'
  use 'sainnhe/everforest'
  use { 'prettier/vim-prettier' }
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
	use 'Iron-E/nvim-highlite'
	use 'szw/vim-maximizer'
	use 'kassio/neoterm'
	use 'sbdchd/neoformat'
	use 'neovim/nvim-lspconfig'
  use 'preservim/nerdcommenter'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
      'kyazdani42/nvim-tree.lua',
      config = function() require'nvim-tree'.setup {} end
  }
	use 'vimwiki/vimwiki'
	use { 'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate' }
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'alaviss/nim.nvim'
  use {
    'lewis6991/gitsigns.nvim', 
    config = function () require('gitsigns').setup{} end }
  use "rafamadriz/neon"
	use 'mfussenegger/nvim-dap'
	use 'nvim-telescope/telescope-dap.nvim'
	use 'theHamsta/nvim-dap-virtual-text'
	use 'Mofiqul/vscode.nvim'
	use 'TimUntersberger/neogit'
	use 'projekt0n/github-nvim-theme'
	use 'folke/zen-mode.nvim'
	use 'nvim-treesitter/playground'
	use 'David-Kunz/treesitter-unit'
	use 'Pocco81/TrueZen.nvim'
	use 'tpope/vim-fugitive'
	use 'p00f/nvim-ts-rainbow'
	use 'sindrets/diffview.nvim'
end)
