-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- local config = wezterm.config_builder()
if wezterm.config_builder then config = wezterm.config_builder() end

config.color_scheme = 'Gruvbox dark, soft (base16)'

config.font = wezterm.font('JetBrains Mono', { weight = "Regular" })
config.font_size = 18

config.enable_tab_bar = false

-- config.enable_scroll_bar = false

config.window_decorations = 'RESIZE'

config.window_padding = {
    left   = 0,
    right  = 0,
    top    = 0,
    bottom = 0,
}

-- config.inactive_pane_hsb = {

--     saturation = 0.6,
--     brightness = 0.7
-- }

config.colors = {
    background = "28282899"
}







-- and finally, return the configuration to wezterm
return config
