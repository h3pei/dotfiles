vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require("nvim-tree.api")

-- @see https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#nerdtree-style-copy-file-to
local function copy_file_to()
  local file_src = api.tree.get_node_under_cursor().absolute_path
  local file_out = vim.fn.input("Copy to: ", file_src, "file")
  local dir = vim.fn.fnamemodify(file_out, ":h")

  vim.fn.system({ "mkdir", "-p", dir })
  vim.fn.system({ "cp", "-R", file_src, file_out })
end

local function my_on_attach(bufnr)
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- MEMO:
  -- `m` は bookmark が割り当てられているがおそらく使わないので NERDTree-like な mapping で上書き
  -- `c` は copy として使いたいが、`c` で copy -> `p` でペースト -> `r` で rename というフローになり面倒なため、NERDTree-like な操作ができるように上書きした
  -- add, delete はこれまでと同じ操作感なので何もしていない
  vim.keymap.set("n", "m", api.fs.rename, opts("Rename"))
  vim.keymap.set("n", "c", copy_file_to, opts("Copy File To"))
end

require("nvim-tree").setup({
  actions = {
    open_file = {
      -- ファイルを開いたら NvimTree を閉じる
      quit_on_open = true,
    },
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
  filters = {
    -- .gitignore されたファイルも表示する
    -- telescope で検索対象外にしているファイルを file explorer から参照したいケースが多いため
    git_ignored = false,
    -- 以下は読み込むと重くなる、かつエディタで見るケースがほぼ考えられないため除外する
    custom = {
      "^\\.git",
      "^node_modules",
      "^\\.cache", -- gatsby
      "^cache", -- rails
      "^vendor", -- rails, bundler
    },
  },
})
