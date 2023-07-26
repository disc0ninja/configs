local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux
local font_size = 10.0

-- MacOs overrides
if wezterm.target_triple == 'x86_64-apple-darwin' then
  font_size = 14.0
  wezterm.on("gui-startup", function()
    local tab, pane, window = mux.spawn_window {}
    window:gui_window():maximize()
  end)
end


return {
  send_composed_key_when_left_alt_is_pressed = false,
  use_ime = false,
  --------------------------------------------------
  -- Themeing
  --------------------------------------------------
  --color_scheme = "Abernathy",
  color_scheme = "Abernathy",
  inactive_pane_hsb = {
    saturation = 1.0,
    brightness = 1.2,
  },
  font_size = font_size,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  hide_tab_bar_if_only_one_tab = true,
  font = wezterm.font_with_fallback({ 'Hack Nerd Font Mono', "Noto Color Emoji" }),
  window_frame = {
    -- The size of the font in the tab bar.
    -- Default to 10. on Windows but 12.0 on other systems
    font_size = 10.0,
    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = '#111416',
    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#333333',
  },
  --------------------------------------------------
  -- Configuration
  --------------------------------------------------
  -- get rid of annoying error about missing glyphs
  warn_about_missing_glyphs = false,
  scrollback_lines = 10000,
  enable_scroll_bar = true,
  --------------------------------------------------
  -- Key Maps
  --------------------------------------------------
  leader = { key = 'a', mods = 'ALT', timeout_milliseconds = 1500 },
  keys = {
    --------------------------------------------------
    -- Window/Pane Management
    --------------------------------------------------
    { key = ';',     mods = 'ALT',          action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = "'",     mods = 'ALT',          action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'h',     mods = 'ALT',          action = act.ActivatePaneDirection 'Left' },
    { key = 'j',     mods = 'ALT',          action = act.ActivatePaneDirection 'Down' },
    { key = 'k',     mods = 'ALT',          action = act.ActivatePaneDirection 'Up' },
    { key = 'l',     mods = 'ALT',          action = act.ActivatePaneDirection 'Right' },
    { key = 'h',     mods = 'ALT|SHIFT',    action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'j',     mods = 'ALT|SHIFT',    action = act.AdjustPaneSize { 'Down', 5 } },
    { key = 'k',     mods = 'ALT|SHIFT',    action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'l',     mods = 'ALT|SHIFT',    action = act.AdjustPaneSize { 'Right', 5 } },
    { key = 'Space', mods = 'LEADER',       action = act.RotatePanes 'Clockwise' },
    { key = 'Space', mods = 'LEADER|SHIFT', action = act.RotatePanes 'CounterClockwise', },
    { key = 's',     mods = 'LEADER',       action = act.PaneSelect { alphabet = '1234567890', }, },
    { key = "z",     mods = "LEADER",       action = "TogglePaneZoomState" },
  },
  --------------------------------------------------
}
