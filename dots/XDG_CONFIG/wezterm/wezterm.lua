local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

-- Open fullscreen on macos
if wezterm.target_triple == 'x86_64-apple-darwin' then
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
    saturation = 0.7,
    brightness = 0.7,
  },
  font_size = 16.0,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  hide_tab_bar_if_only_one_tab = true,
  font = wezterm.font 'Hack Nerd Font Mono',
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
  scrollback_lines = 100000,
  enable_scroll_bar = true,
  --------------------------------------------------
  -- Key Maps
  --------------------------------------------------
  --   leader = { key = 'Alt', timeout_milliseconds = 1500 },
  --   keys = {
  --     --------------------------------------------------
  --     -- Window/Pane Management
  --     --------------------------------------------------
  --     { key = ';', mods = 'ALT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  --     { key = "'", mods = 'ALT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  --     { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
  --     { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },
  --     { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
  --     { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
  --     { key = 'h', mods = 'LEADER', action = act.AdjustPaneSize { 'Left', 5 } },
  --     { key = 'j', mods = 'LEADER', action = act.AdjustPaneSize { 'Down', 5 } },
  --     { key = 'k', mods = 'LEADER', action = act.AdjustPaneSize { 'Up', 5 } },
  --     { key = 'l', mods = 'LEADER', action = act.AdjustPaneSize { 'Right', 5 } },
  --     { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_panes', timeout_milliseconds = 15000, replace_current = false, one_shot = false } },
  --     { key = 'R', mods = 'ALT', action = act.ResetFontAndWindowSize },
  --     { key = 'Space', mods = 'LEADER', action = act.RotatePanes 'Clockwise' },
  --     { key = 'Space', mods = 'LEADER|SHIFT', action = act.RotatePanes 'CounterClockwise', },
  --     { key = 's', mods = 'LEADER', action = act.PaneSelect { alphabet = '1234567890', }, },
  --     { key = 'S', mods = 'LEADER', action = act.PaneSelect { mode = 'SwapWithActive', } },
  --     --{ key="z" , mods="LEADER", action = "TogglePaneZoomState" },
  --     { key="z" , mods="LEADER", action = act.ActivateKeyTable { name = 'zoom_actions', timeout_milliseconds = 1000, replace_current = false, one_shot = false} },
  --     { key="x", mods="LEADER", action  = act { CloseCurrentPane = { confirm = true } } },
  --   },
  --   --------------------------------------------------
  --   -- Key Tables
  --   --------------------------------------------------
  --   key_tables = {
  --     resize_panes = {
  --       { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },
  --       { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },
  --       { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },
  --       { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },
  --       { key = 'Escape', action = act.PopKeyTable }
  --     },
  --     zoom_actions = {
  --       { key="z" , action = "TogglePaneZoomState" },
  --       { key="+" , action = act.IncreaseFontSize },
  --       { key="-" , action = act.DecreaseFontSize },
  --     },
  --   },
}
