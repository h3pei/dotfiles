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
  keys = {
    { key = "u", mods = "CMD", action = wezterm.action.EmitEvent("toggle-opacity") },
    { key = ",", mods = "CMD", action = wezterm.action.SpawnCommandInNewTab({ args = { "/opt/homebrew/bin/nvim", os.getenv("WEZTERM_CONFIG_FILE") } }) },
  },
  color_scheme = "Jellybeans",
  font = wezterm.font("Cica", { weight = "Bold" }),
  font_size = 15.0,
  line_height = 1.25,
  window_background_opacity = 0.85,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
}
