local packer = require('packer')

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-lua/plenary.nvim'

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use { 'glepnir/lspsaga.nvim', branch = 'main' }
  use { 'folke/trouble.nvim' }

  -- Autocompletation
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Themes
  use { 'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end }
  use 'rebelot/kanagawa.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- Language Tools
  use 'akinsho/flutter-tools.nvim'
  use 'posva/vim-vue'
  use 'pearofducks/ansible-vim'

  use 'norcalli/nvim-colorizer.lua' -- Color Highlighter
end)
