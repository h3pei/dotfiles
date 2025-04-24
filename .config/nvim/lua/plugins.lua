-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "AckslD/nvim-neoclip.lua", dependencies = { "nvim-telescope/telescope.nvim" } },
  { "akinsho/git-conflict.nvim", version = "*" },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  { "bronson/vim-trailing-whitespace" },
  { "github/copilot.vim" },
  { "haya14busa/vim-asterisk" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lsp-document-symbol" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/nvim-cmp" },
  { "j-hui/fidget.nvim" },
  { "junegunn/vim-easy-align" },
  { "kylechui/nvim-surround", config = true, event = "VeryLazy" },
  { "lewis6991/gitsigns.nvim" },
  { "mattn/emmet-vim" },
  { "h3pei/autosave.nvim", config = true },
  { "h3pei/buf-sweep.nvim" },
  { "h3pei/copy-file-path.nvim" },
  { "h3pei/go-to-factory-bot.nvim", config = true },
  { "h3pei/rspec.nvim" },
  { "h3pei/trace-pr.nvim" },
  { "neovim/nvim-lspconfig" },
  { "numToStr/Comment.nvim" },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvimtools/none-ls.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "rmagatti/auto-session" },
  { "romgrk/barbar.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "thinca/vim-quickrun" },
  { "tpope/vim-endwise", ft = "ruby" },
  { "tpope/vim-rails" },
  { "vim-scripts/ReplaceWithRegister" },
  { "williamboman/mason-lspconfig.nvim" },
  { "williamboman/mason.nvim", config = true },
  { "windwp/nvim-autopairs", config = true, event = "InsertEnter" },
  { "windwp/nvim-ts-autotag" },
}, {
  dev = {
    path = "~/ghq/github.com/h3pei",
  },
})

-- written in Vim script
require("plugins/copilot")
require("plugins/vim-asterisk")
require("plugins/vim-easy-align")
require("plugins/vim-quickrun")
require("plugins/vim-rails")

-- written in Lua
require("plugins/Comment")
require("plugins/auto-session")
require("plugins/barbar")
require("plugins/fidget")
require("plugins/git-conflict")
require("plugins/gitsigns")
require("plugins/go-to-factory-bot")
require("plugins/lualine")
require("plugins/mason-lspconfig")
require("plugins/none-ls")
require("plugins/nvim-cmp")
require("plugins/nvim-neoclip")
require("plugins/nvim-tree")
require("plugins/nvim-treesitter")
require("plugins/nvim-ts-autotag")
require("plugins/rspec")
require("plugins/trace-pr")
require("plugins/telescope")
require("plugins/toggleterm")
