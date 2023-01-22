require('bootstrap')

local lazy = require('lazy')

lazy.setup({
  'nvim-lua/plenary.nvim',

  -- Telescope
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x' },
  'nvim-telescope/telescope-file-browser.nvim',

  -- LSP
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'folke/trouble.nvim',

  -- Autocompletation
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
    }
  },

  -- Snippets
  'L3MON4D3/LuaSnip',

  -- Debugging
  'mfussenegger/nvim-dap',

  -- Color Themes
  'rebelot/kanagawa.nvim',
  { 'catppuccin/nvim', name = 'catppuccin' },

  -- UI
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'kyazdani42/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',

  -- Git integration
  'lewis6991/gitsigns.nvim',

  -- Language Tools
  { 'akinsho/flutter-tools.nvim', ft = 'dart' },
  { 'posva/vim-vue', ft = 'vue' },
  { 'folke/neodev.nvim', ft = 'lua' },

  'norcalli/nvim-colorizer.lua', -- Color Highlighter
  'editorconfig/editorconfig-vim', -- Add .editorconfig support
  'numToStr/Comment.nvim', -- Comment plugin
  'folke/todo-comments.nvim', -- Highlight and search for todo comments
  'windwp/nvim-autopairs', -- Autopair plugin
  'andymass/vim-matchup', -- Navigate and highlight matching words
  'tpope/vim-surround',
})
