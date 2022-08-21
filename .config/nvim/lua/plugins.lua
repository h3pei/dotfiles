-- see: https://github.com/sheerun/vim-polyglot#troubleshooting
vim.g.polyglot_disabled = { 'markdown' }

vim.cmd [[
call plug#begin('~/.local/share/nvim/plugged')
Plug 'L3MON4D3/LuaSnip'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ap/vim-buftabline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mattn/emmet-vim'
Plug 'neovim/nvim-lspconfig'
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
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
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
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
})

-- telescope
-- see: https://github.com/nvim-telescope/telescope.nvim/blob/d793de0f12d874c463e81edabee741b802c1a37a/lua/telescope/mappings.lua
local telescope = require('telescope')
local telescope_actions = require('telescope.actions')
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

-- LSP (nvim-lspconfig, mason, mason-lspconfig)
local nvim_lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
end

nvim_lspconfig.solargraph.setup({
  on_attach = on_attach,
})
nvim_lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})
nvim_lspconfig.jsonls.setup({
  on_attach = on_attach,
})
nvim_lspconfig.tsserver.setup({
  on_attach = on_attach,
})

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'solargraph',
    'sumneko_lua',
    'jsonls',
    'tsserver',
  },
})

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
    {
      { name = 'buffer' },
    }
  )
})
