local status_treesitter, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status_treesitter) then return end

treesitter.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'lua',
    'html',
    'css',
    'json',
    'yaml',
    'toml',
    'tsx'
  },
  autotag = {
    enable = true
  },
}
