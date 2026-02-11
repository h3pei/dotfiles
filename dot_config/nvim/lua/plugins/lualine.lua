require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "dracula",
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    -- path = 3: Absolute path, with tilde as the home directory
    lualine_c = { { "filename", path = 3 } },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "location" },
    lualine_z = {},
  },
})
