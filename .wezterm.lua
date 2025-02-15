local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10
config.bold_brightens_ansi_colors = true
config.hide_mouse_cursor_when_typing = true

return config
