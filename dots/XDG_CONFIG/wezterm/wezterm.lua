local wezterm = require 'wezterm'
local act = wezterm.action
return {
  color_scheme = "Abernathy",
  scrollback_lines = 100000,
  -- map ALT + a to leader
  -- Keybinds
  leader = { key = 'a', mods = 'ALT' },
  keys = {
    -- Pane splits/movements
    { key = ';', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = "'", mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
    { key = 'h', mods = 'LEADER', action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'j', mods = 'LEADER', action = act.AdjustPaneSize { 'Down', 5 } },
    { key = 'k', mods = 'LEADER', action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'l', mods = 'LEADER', action = act.AdjustPaneSize { 'Right', 5 } },
    { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable {
        name = 'resize_panes',
        timeout_milliseconds = 15000,
        replace_current = false,
        one_shot = false
      }
    }
  },

  key_tables = {
   resize_panes = {
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'Escape', action = act.PopKeyTable }
   },
  },
}
