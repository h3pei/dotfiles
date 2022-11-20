local wezterm = require("wezterm")

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
  },
  color_scheme = "zenburn (terminal.sexy)",
  font = wezterm.font("Cica", { weight = "Bold" }),
  font_size = 15.0,
  line_height = 1.25,
  window_background_opacity = 0.8,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
}
