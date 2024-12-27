local wezterm = require('wezterm')
local utils = require('utils')

local config = {}

local function font_with_fallback(font_family)
  -- family names, not file names
  return wezterm.font_with_fallback({
    font_family,
    "Font Awesome 6 Free Solid", -- nice double-spaced symbols!
  })
end

local function calculate_font_size(uname, osname)
  wezterm.log_info ("UNAME = "..uname..", OSNAME = "..osname)
  if osname == 'macos' then
    return 14.0
  end
  return 12.0
end


config.font_dirs = {"fonts"}
config.font = font_with_fallback("Monaspace Neon")
config.font_size = calculate_font_size(utils.os_name())
config.harfbuzz_features = {
  "zero", -- Use a slashed zero '0' (instead of dotted)
  "kern", -- (default) kerning (todo check what is really is)
  "liga", -- (default) ligatures
  "clig", -- (default) contextual ligatures
  'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'calt', 'dlig'
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

local padding_space = 3
config.window_padding = {
  left    = padding_space,
  right   = padding_space,
  top     = padding_space,
  bottom  = padding_space,
}

config.window_background_opacity = 0.97

config.inactive_pane_hsb = {
  -- NOTE: these values are multipliers, applied on normal pane values
  saturation = 0.9,
  brightness = 0.6,
}

config.color_scheme = 'Catppuccin Mocha'

config.scrollback_lines = 100000
config.enable_scroll_bar = true

return config

