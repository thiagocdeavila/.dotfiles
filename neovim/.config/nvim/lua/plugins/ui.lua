return {
  -- Icons
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },
  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        theme = 'auto',
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
          { 'diagnostics' },
          { 'filetype', icon_only = true },
          { 'filename', path = 1 },
        },
      },
    },
  },
}
