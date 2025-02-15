local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10
config.bold_brightens_ansi_colors = true
config.hide_mouse_cursor_when_typing = true

config.colors = {
  foreground = '#a9b1d6',
  background = '#1a1b26',

  cursor_bg = '#c0caf5',
  cursor_fg = '#1a1b26',
  cursor_border = '#c0caf5',

  selection_fg = 'none',
  selection_bg = '#28344a',

  ansi = {
    '#414868', -- black
    '#f7768e', -- red
    '#73daca', -- green
    '#e0af68', -- yellow
    '#7aa2f7', -- blue
    '#bb9af7', -- magenta
    '#7dcfff', -- cyan
    '#c0caf5', -- white
  },
  brights = {
    '#414868', -- bright black
    '#f7768e', -- bright red
    '#73daca', -- bright green
    '#e0af68', -- bright yellow
    '#7aa2f7', -- bright blue
    '#bb9af7', -- bright magenta
    '#7dcfff', -- bright cyan
    '#c0caf5', -- bright white
  },

  tab_bar = {
    background = '#101014',
    active_tab = {
      bg_color = '#16161e',
      fg_color = '#3d59a1',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#16161e',
      fg_color = '#787c99',
      intensity = 'Bold',
    },
  },
}

return config
