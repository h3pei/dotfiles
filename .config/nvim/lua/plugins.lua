vim.cmd([[
call plug#begin('~/.local/share/nvim/plugged')
Plug 'EdenEast/nightfox.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'ap/vim-buftabline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mattn/emmet-vim'
Plug 'mogulla3/rspec.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'slim-template/vim-slim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'windwp/nvim-autopairs'
call plug#end()
]])

-- written in Vim script
require("plugins/vim-auto-save")
require("plugins/nerdtree")
require("plugins/nerdcommenter")
require("plugins/vim-quickrun")
require("plugins/vim-rails")

-- written in Lua
require("plugins/telescope")
require("plugins/nvim-autopairs")
require("plugins/lualine")
require("plugins/gitsigns")
require("plugins/nvim-lspconfig")
require("plugins/mason")
require("plugins/mason-lspconfig")
require("plugins/rspec")
require("plugins/null-ls")
require("plugins/nvim-cmp")
require("plugins/nvim-treesitter")
