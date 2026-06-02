require("flash").setup({
  modes = {
    -- char モード = f/t/F/T と ;/, の強化機能。
    -- 有効にすると ; , がグローバルに再マップされる。
    -- ;f ;r ;t など ; 始まりの自作マッピングを多用しているため無効にしている。
    -- f/t の強化が欲しくなったら enabled = true にする。
    char = { enabled = false },
  },
})

-- s でラベルジャンプ (normal / visual)
-- NOTE: operator-pending (o) には割り当てない。
-- nvim-surround の ds / cs を奪わないようにするため (ds/cs は d/c 始まりなので s 単独とは衝突しない)。
vim.keymap.set({ "n", "x" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })
