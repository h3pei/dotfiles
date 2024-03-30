local wezterm = require("wezterm")
local os = require("os")

wezterm.on("toggle-opacity", function(window, _)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 1.0
  else
    overrides.window_background_opacity = nil
  end

  window:set_config_overrides(overrides)
end)

return {
  adjust_window_size_when_changing_font_size = false,
  color_scheme = "Hybrid (terminal.sexy)",
  font = wezterm.font("Cica", { weight = "Bold" }),
  font_size = 15.0,
  hide_tab_bar_if_only_one_tab = true,
  hyperlink_rules = {
    -- Linkify things that look like URL.
    -- The wezterm default config doesn't support `localhost`, so I customized it.
    -- see: https://wezfurlong.org/wezterm/hyperlinks.html#implicit-hyperlinks
    {
      regex = [[\bhttps?://[\w.-]+\S*\b]],
      format = '$0',
    },
    -- Linkify things that look like URLs with numeric addresses as hosts.
    -- Based on examples in the wezterm doc.
    {
      regex = [[\bhttps?://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
      format = '$0',
    },
  },
  keys = {
    { key = "u", mods = "CMD", action = wezterm.action.EmitEvent("toggle-opacity") },
    { key = ",", mods = "CMD", action = wezterm.action.SpawnCommandInNewTab({ args = { "/opt/homebrew/bin/nvim", os.getenv("WEZTERM_CONFIG_FILE") } }) },
    { key = "-", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
    { key = "=", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
    { key = "+", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
    { key = "_", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
  },
  line_height = 1.25,
  macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL',
  selection_word_boundary = " \t\n{}[]()\"'`│",
  use_ime = true,
  window_background_opacity = 0.82,
}
