-- see: https://github.com/sheerun/vim-polyglot#troubleshooting
vim.g.polyglot_disabled = { 'markdown' }

vim.cmd [[
call plug#begin('~/.local/share/nvim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'ap/vim-buftabline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'dense-analysis/ale', { 'for': ['ruby', 'javascript', 'typescript'] }
Plug 'lewis6991/gitsigns.nvim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'thinca/vim-quickrun'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'vim-test/vim-test', { 'for': 'ruby' }
Plug 'windwp/nvim-autopairs'
call plug#end()
]]

vim.g.auto_save = true
vim.g.auto_save_in_insert_mode = false

-- NERDTree
vim.g.NERDTreeShowHidden = true
vim.g.NERDTreeQuitOnOpen = 3 -- close after opening file and bookmark
vim.g.NERDTreeWinSize = 50

-- NERD Commenter
vim.g.NERDSpaceDelims = true

-- coc.nvim
-- * extensionは最低限としている
-- * 不要になったextensionは `:CocUninstall :extension_name` で削除する
vim.g.coc_status_error_sign = 'E'
vim.g.coc_status_warning_sign = 'W'
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-solargraph',
  'coc-tsserver',
  'coc-html',
}

-- ALE
vim.g.ale_disable_lsp = true
vim.g.ale_linters_explicit = true -- ale_lintersとして定義したもののみ実行
vim.g.ale_lint_on_enter = true
vim.g.ale_lint_on_save = true
vim.g.ale_lint_on_text_changed = false
vim.g.ale_lint_on_filetype_changed = false
vim.g.ale_lint_on_insert_leave = false
vim.g.ale_linters = {
    ruby = { 'rubocop' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
}
vim.g.ale_fix_on_save = false
vim.g.ale_fixers = {
  ruby = { 'rubocop' },
  javascript = { 'prettier' },
  typescript = { 'prettier' },
}
vim.g.ale_ruby_rubocop_executable = 'bundle'
vim.g.ale_ruby_rubocop_auto_correct_all = true
vim.g.ale_javascript_prettier_use_local_config = true

-- test.vim
vim.g['test#strategy'] = 'dispatch'
vim.g['test#runner_commands'] = { 'RSpec' }

-- quickrun.vim
-- * opener:
--   - 実行結果を水平分割でウィンドウ下部に表示する
--   - 実行結果のウィンドウにカーソルを移動させない
-- * close_on_empty: 実行結果が空の場合、バッファを自動で閉じる
vim.g.quickrun_config = {
    _ = {
      ['outputter/buffer/opener'] = ':botright 8split',
      ['outputter/buffer/close_on_empty'] = true,
    },
}

-- rails.vim
vim.g.rails_projections = {
  ["app/controllers/*_controller.rb"] = {
    test = {
      "spec/requests/{}_spec.rb",
      "spec/controllers/{}_spec.rb",
    },
  },
  ["spec/requests/*_spec.rb"] = {
    alternate = {
      "app/controllers/{}_controller.rb",
    },
  },
}

require('lualine').setup({
  options = {
     icons_enabled = false,
     theme = 'dracula',
     component_separators = '',
     section_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename' },
    lualine_c = { 'branch', 'diff', 'diagnostics' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  }
})

require('nvim-autopairs').setup()

require('gitsigns').setup({
  signs = {
    add          = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn' },
    change       = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
  },
})

-- telescope
local telescope = require('telescope')
local telescope_actions = require('telescope.actions')

-- see: https://github.com/nvim-telescope/telescope.nvim/blob/d793de0f12d874c463e81edabee741b802c1a37a/lua/telescope/mappings.lua
telescope.setup({
  defaults = {
    mappings = {
      -- `n` => normal mode
      n = {
        ['<C-q>'] = telescope_actions.smart_send_to_qflist + telescope_actions.open_qflist,
      },
      -- `i` => insert mode
      i = {
        ['<Esc>'] = telescope_actions.close,
        -- WARN: 本来はカーソル位置より前を全削除にしたかったが、全体削除の挙動になっている
        ['<C-u>'] = { '<C-O>d^', type = 'command' },
        ['<C-q>'] = telescope_actions.smart_send_to_qflist + telescope_actions.open_qflist,
      }
    },
  },
  pickers = {
    -- find_files を使う場合は広めに検索をしたいはず、という状況を想定.
    -- よって .gitignore に登録されたファイルも対象にするし、隠しファイルも対象にする
    find_files = {
      hidden = true,
      no_ignore = true,
    },
    -- live_grep では隠しファイルは対象にしたいが、.gitignoreされたファイルは不要なはず
    live_grep = {
      additional_args = function()
        return { '--hidden' }
      end
    },
  }
})
telescope.load_extension('fzf')
