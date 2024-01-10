local wezterm = require 'wezterm'
local config = {}

config.font_dirs = {"fonts"}

local function font_with_fallback(font_family)
  -- family names, not file names
  return wezterm.font_with_fallback({
    font_family,
    "Font Awesome 6 Free Solid", -- nice double-spaced symbols!
  })
end


config.hide_tab_bar_if_only_one_tab = true

-- Pad window to avoid the content to be too close to the border,
-- so it's easier to see and select.
config.window_padding = {
  left = 3, right = 3,
  top = 3, bottom = 3,
}

config.inactive_pane_hsb = {
  -- NOTE: these values are multipliers, applied on normal pane values
  saturation = 0.9,
  brightness = 0.6,
}

-- TODO: asd asd
-- FIXME: (<- this is an example of bolded text)
-- 0 1 2 3 4 5 6 7 8 9
-- Some ligatures: != <-> <-  -> ----> => ==> ===> -- --- /../;;/ #{}
--  <> <!-- --> ->> --> <= >= ++ == === := a::b::c a&&b a||b 

config.color_scheme = 'OneDark (base16)'
config.font = font_with_fallback("Monaspace Neon")
config.font_size = 15.0
config.harfbuzz_features = {
  "zero", -- Use a slashed zero '0' (instead of dotted)
  "kern", -- (default) kerning (todo check what is really is)
  "liga", -- (default) ligatures
  "clig", -- (default) contextual ligatures
  'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'calt', 'dlig'
}

config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Monaspace Neon', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 13.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}


return config

