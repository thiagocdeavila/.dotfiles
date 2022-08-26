local status_devicons, devicons = pcall(require, 'nvim-web-devicons')
if (not status_devicons) then return end

devicons.setup {
  override = {},
  default = true,
}
