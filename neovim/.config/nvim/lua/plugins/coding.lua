return {
  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'VeryLazy',
    config = function(_, opts)
      require('nvim-autopairs').setup(opts)
    end
  },

  -- Comments
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    config = true
  },
}
