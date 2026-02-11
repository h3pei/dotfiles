-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- MEMO: `opts = {}` を渡すと、`require(PLUGIN_NAME).setup(opts)` を呼び出す
require("lazy").setup({
  { "AckslD/nvim-neoclip.lua", dependencies = { { "nvim-telescope/telescope.nvim" }, { "kkharji/sqlite.lua" } } },
  { "HakonHarnes/img-clip.nvim", event = "VeryLazy" },
  { "akinsho/toggleterm.nvim", version = "*", opts = {} },
  { "bronson/vim-trailing-whitespace" },
  { "github/copilot.vim" },
  { "h3pei/autosave.nvim", opts = {} },
  { "h3pei/buf-sweep.nvim" },
  { "h3pei/case-dial.nvim", opts = {} },
  { "h3pei/copy-file-path.nvim" },
  { "h3pei/go-to-factory-bot.nvim", ft = "ruby", opts = {} },
  { "h3pei/rspec.nvim", ft = "ruby" },
  { "h3pei/ruby-block-toggle.nvim", ft = "ruby", opts = {}, dependencies = { "nvim-treesitter/nvim-treesitter" } },
  { "h3pei/ruby-fqcn.nvim", ft = "ruby", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  { "h3pei/trace-pr.nvim" },
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
  { "kylechui/nvim-surround", opts = {}, event = "VeryLazy" },
  { "lewis6991/gitsigns.nvim" },
  { "mattn/emmet-vim" },
  { "neovim/nvim-lspconfig" },
  { "numToStr/Comment.nvim" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope.nvim", tag = "v0.2.0", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvimtools/none-ls.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "rmagatti/auto-session" },
  { "romgrk/barbar.nvim" },
  { "sindrets/diffview.nvim" },
  { "thinca/vim-quickrun" },
  { "tpope/vim-endwise", ft = "ruby" },
  { "tpope/vim-rails" },
  { "vim-scripts/ReplaceWithRegister" },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim" } },
  { "williamboman/mason.nvim", opts = {} },
  { "windwp/nvim-autopairs", opts = {}, event = "InsertEnter" },
  { "windwp/nvim-ts-autotag", opts = {} },
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
require("plugins/gitsigns")
require("plugins/go-to-factory-bot")
require("plugins/img-clip")
require("plugins/lualine")
require("plugins/none-ls")
require("plugins/nvim-cmp")
require("plugins/nvim-neoclip")
require("plugins/nvim-tree")
require("plugins/nvim-treesitter")
require("plugins/rspec")
require("plugins/trace-pr")
require("plugins/telescope")
require("plugins/toggleterm")
