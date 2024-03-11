-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "AckslD/nvim-neoclip.lua", dependencies = { "nvim-telescope/telescope.nvim" } },
  { "EdenEast/nightfox.nvim" },
  { "L3MON4D3/LuaSnip", version = "v2.*" },
  { "akinsho/git-conflict.nvim", version = "*" },
  { "arecarn/vim-fold-cycle" },
  { "bronson/vim-trailing-whitespace" },
  { "github/copilot.vim" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lsp-document-symbol" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/nvim-cmp" },
  { "j-hui/fidget.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "kylechui/nvim-surround", event = "VeryLazy" },
  { "lewis6991/gitsigns.nvim" },
  { "mattn/emmet-vim" },
  { "mogulla3/autosave.nvim" },
  { "mogulla3/buf-sweep.nvim" },
  { "mogulla3/copy-file-path.nvim" },
  { "mogulla3/go-to-factory-bot.nvim" },
  { "mogulla3/rspec.nvim" },
  { "neovim/nvim-lspconfig" },
  { "numToStr/Comment.nvim" },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "romgrk/barbar.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "thinca/vim-quickrun" },
  { "tpope/vim-endwise", ft = "ruby" },
  { "tpope/vim-rails" },
  { "williamboman/mason-lspconfig.nvim" },
  { "williamboman/mason.nvim" },
  { "windwp/nvim-autopairs", event = "InsertEnter" },
  { "windwp/nvim-ts-autotag" },
}, {
  dev = {
    path = "~/ghq/github.com/mogulla3",
  },
})

-- written in Vim script
require("plugins/copilot")
require("plugins/vim-fold-cycle")
require("plugins/vim-quickrun")
require("plugins/vim-rails")

-- written in Lua
require("plugins/Comment")
require("plugins/autosave")
require("plugins/barbar")
require("plugins/fidget")
require("plugins/git-conflict")
require("plugins/go-to-factory-bot")
require("plugins/gitsigns")
require("plugins/lualine")
require("plugins/mason")
require("plugins/mason-lspconfig")
require("plugins/null-ls")
require("plugins/nvim-autopairs")
require("plugins/nvim-cmp")
require("plugins/nvim-lspconfig")
require("plugins/nvim-neoclip")
require("plugins/nvim-surround")
require("plugins/nvim-tree")
require("plugins/nvim-treesitter")
require("plugins/nvim-ts-autotag")
require("plugins/rspec")
require("plugins/telescope")
