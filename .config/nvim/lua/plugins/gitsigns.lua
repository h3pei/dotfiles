local gitsigns = require("gitsigns")

gitsigns.setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
})

vim.keymap.set("n", "<C-]>", function()
  gitsigns.nav_hunk("next")
end)
vim.keymap.set("n", "<C-[>", function()
  gitsigns.nav_hunk("prev")
end)
vim.keymap.set("n", "<Leader>b", function()
  gitsigns.blame_line({ full = true })
end)
