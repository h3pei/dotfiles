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

local config = {
  adjust_window_size_when_changing_font_size = false,
  color_scheme = "Hybrid (terminal.sexy)",
  font = wezterm.font("Cica"),
  font_size = 18.0,
  hide_tab_bar_if_only_one_tab = true,
  hyperlink_rules = wezterm.default_hyperlink_rules(),
  keys = {
    { key = "u", mods = "CMD", action = wezterm.action.EmitEvent("toggle-opacity") },
    { key = ",", mods = "CMD", action = wezterm.action.SpawnCommandInNewTab({ args = { "/opt/homebrew/bin/nvim", os.getenv("WEZTERM_CONFIG_FILE") } }) },
    { key = "-", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
    { key = "=", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
    { key = "+", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
    { key = "_", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
    { key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\n") },
  },
  line_height = 1.25,
  macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL',
  selection_word_boundary = " \t\n{}[]()\"'`│┃",
  use_ime = true,
  warn_about_missing_glyphs = false,
  window_background_opacity = 0.80,
  window_decorations = "RESIZE",
  window_padding = {
    left = '1.2cell',
    right = '1.2cell',
    top = '0.8cell',
    bottom = '0.3cell',
  }
}

-- docker-desktop のカスタムURLスキーマに対応
-- 例: docker-desktop://dashboard/build/desktop-linux/desktop-linux/xxx
table.insert(config.hyperlink_rules, {
  regex = 'docker-desktop://[\\w\\-\\._~:/?#\\[\\]@!$&\'()*+,;=]+',
  format = '$0',
})

return config
