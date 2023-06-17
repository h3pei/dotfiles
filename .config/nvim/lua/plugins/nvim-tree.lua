vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- MEMO: `m` は bookmark が割り当てられているがおそらく使わないので NERDTree-like な mapping で上書き
  -- よく使っていた add, delete, copy は NERDTree とほぼ同じマッピングなので何もしない
  vim.keymap.set("n", "m", api.fs.rename, opts("Rename"))
end

require("nvim-tree").setup({
  actions = {
    open_file = {
      -- ファイルを開いたら NvimTree を閉じる
      quit_on_open = true,
    }
  },
  -- disgnostics はおそらく使わないので無効化
  diagnostics = {
    enable = false,
  },
  -- keymap の変更のために指定
  on_attach = my_on_attach,
  view = {
    width = 50,
  },
  -- respect_buf_cwd と update_focused_file の関係性を整理しきれていないが、
  -- 「NvimTree を開いたとき、現在の buffer のファイルにフォーカスさせる. 現在の buffer が存在しないときは cwd とする」ために必要と思われる設定
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})
