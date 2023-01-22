local status_treesitter, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status_treesitter) then return end

treesitter.setup {
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  autotag = {
    enable = true
  },
}
