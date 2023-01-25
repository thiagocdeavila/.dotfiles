return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    ---@type TSConfig
    opts = {
      ensure_installed = 'all',
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = {
        enable = true
      },
    },
    ---@param opts TSConfig
    config = function(plugin, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
