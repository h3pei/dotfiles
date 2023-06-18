vim.cmd([[
call plug#begin('~/.local/share/nvim/plugged')
Plug 'EdenEast/nightfox.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'arecarn/vim-fold-cycle'
Plug 'bronson/vim-trailing-whitespace'
Plug 'github/copilot.vim'
Plug 'gpanders/editorconfig.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'kylechui/nvim-surround'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mattn/emmet-vim'
Plug 'mogulla3/autosave.nvim'
Plug 'mogulla3/buf-sweep.nvim'
Plug 'mogulla3/rspec.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'slim-template/vim-slim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tversteeg/registers.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
call plug#end()
]])

-- written in Vim script
require("plugins/vim-fold-cycle")
require("plugins/vim-quickrun")

-- written in Lua
require("plugins/autosave")
require("plugins/barbar")
require("plugins/Comment")
require("plugins/gitsigns")
require("plugins/lualine")
require("plugins/mason")
require("plugins/mason-lspconfig")
require("plugins/null-ls")
require("plugins/nvim-autopairs")
require("plugins/nvim-cmp")
require("plugins/nvim-lspconfig")
require("plugins/nvim-surround")
require("plugins/nvim-tree")
require("plugins/nvim-treesitter")
require("plugins/nvim-ts-autotag")
require("plugins/registers")
require("plugins/rspec")
require("plugins/telescope")
