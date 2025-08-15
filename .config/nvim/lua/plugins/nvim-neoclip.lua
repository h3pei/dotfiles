require("neoclip").setup({
  -- indent を表示するかどうか
  dedent_picker_display = true,
  history = 100,
  preview = false,
  keys = {
    telescope = {
      i = {
        select = "<Space>",
        paste = "<CR>",
      },
      n = {
        select = "<Space>",
        paste = "<CR>",
      },
    },
  },
})
