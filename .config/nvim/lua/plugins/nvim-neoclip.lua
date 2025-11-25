require("neoclip").setup({
  -- indent を表示するかどうか
  dedent_picker_display = true,
  -- vim.opt.clipboard:append({ "unnamedplus" }) を指定すると " と "+" レジスタに保存されるようになり、
  -- paste するときに "+ レジスタを参照するようになるため、それと合わせた挙動にする
  default_register = { '"', "+" },
  enable_persistent_history = true,
  history = 50,
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
