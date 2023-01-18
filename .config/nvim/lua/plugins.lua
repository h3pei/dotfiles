vim.cmd([[
call plug#begin('~/.local/share/nvim/plugged')
Plug 'EdenEast/nightfox.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'ap/vim-buftabline'
Plug 'arecarn/vim-fold-cycle'
Plug 'bronson/vim-trailing-whitespace'
Plug 'gpanders/editorconfig.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mattn/emmet-vim'
Plug 'mogulla3/autosave.nvim'
Plug 'mogulla3/buf-sweep.nvim'
Plug 'mogulla3/rspec.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'slim-template/vim-slim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tversteeg/registers.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'windwp/nvim-autopairs'
call plug#end()
]])

-- written in Vim script
require("plugins/nerdcommenter")
require("plugins/nerdtree")
require("plugins/vim-fold-cycle")
require("plugins/vim-quickrun")

-- written in Lua
require("plugins/autosave")
require("plugins/gitsigns")
require("plugins/lualine")
require("plugins/mason")
require("plugins/mason-lspconfig")
require("plugins/null-ls")
require("plugins/nvim-autopairs")
require("plugins/nvim-cmp")
require("plugins/nvim-lspconfig")
require("plugins/nvim-treesitter")
require("plugins/registers")
require("plugins/rspec")
require("plugins/telescope")
