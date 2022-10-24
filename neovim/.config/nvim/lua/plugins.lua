require('bootstrap')

local packer = require('packer')

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
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
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Debugging
  use 'mfussenegger/nvim-dap'

  -- Color Themes
  use 'rebelot/kanagawa.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- UI
  use { 'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end }
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'

  -- Git integration
  use 'lewis6991/gitsigns.nvim'

  -- Language Tools
  use 'akinsho/flutter-tools.nvim'
  use 'posva/vim-vue'
  use 'pearofducks/ansible-vim'
  use 'folke/neodev.nvim' -- LSP for nvim lua API

  use 'norcalli/nvim-colorizer.lua' -- Color Highlighter
  use 'editorconfig/editorconfig-vim' -- Add .editorconfig support
  use 'numToStr/Comment.nvim' -- Comment plugin
  use 'folke/todo-comments.nvim' -- Highlight and search for todo comments
  use 'windwp/nvim-autopairs' -- Autopair plugin
  use 'andymass/vim-matchup' -- Navigate and highlight matching words
  use 'tpope/vim-surround'
end)
