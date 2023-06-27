local wezterm = require 'wezterm'

local colors = require('lua/themes/rose-pine').colors()
local window_frame = require('lua/themes/rose-pine').window_frame()

local config = {
  colors = colors,
  window_frame = window_frame,
}

config.font = wezterm.font('CaskaydiaCove Nerd Font Mono')
config.font_size = 13.0

config.hide_tab_bar_if_only_one_tab = true

return config
