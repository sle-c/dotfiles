local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }

  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Use packer as a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- colorschemes
  use "folke/tokyonight.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use {
    "hrsh7th/cmp-buffer", -- buffer completions
    requires = {{ "hrsh7th/nvim-cmp", opt = false }},
  }
  use {
    "hrsh7th/cmp-path", -- path completions
    requires = {{ "hrsh7th/nvim-cmp", opt = false }},
  }
  use {
    "hrsh7th/cmp-cmdline", -- cmdline completions
    requires = {{ "hrsh7th/nvim-cmp", opt = false }},
  }
  use {
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    requires = {
      { "hrsh7th/nvim-cmp", opt = false },
      { "L3MON4D3/LuaSnip", opt = false },
    },
  }
  use {
    "hrsh7th/cmp-nvim-lsp",
    requires = {{ "hrsh7th/nvim-cmp", opt = false }},
  }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use {
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use
    requires = {
      { "L3MON4D3/LuaSnip", opt = false },
    },
  }

  -- lsp
  use "neovim/nvim-lspconfig" -- enable lsp
  use "williamboman/nvim-lsp-installer" -- simple to use lanuage server installer

  -- fzf
  use {
    "junegunn/fzf",
    run = ":call fzf#install()",
  }
  use "junegunn/fzf.vim"
  use "jesseleite/vim-agriculture"

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  use "windwp/nvim-autopairs" -- autopairs, integrate with both cmp and treesitter
  use "numToStr/Comment.nvim" -- easily comment things out
  use "JoosepAlviste/nvim-ts-context-commentstring" -- comment in tsx and css

  use "lewis6991/gitsigns.nvim"

  -- nvimtree file browser
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- use "jose-elias-alvarez/null-ls.nvim" -- for formatter and linters

  use "nvim-lualine/lualine.nvim"           -- status line

  use "lukas-reineke/indent-blankline.nvim" -- indent line
  use "lewis6991/impatient.nvim"            -- improve load time
  use "folke/which-key.nvim"                -- show keys configuration

  -- svelte related
  use "leafOfTree/vim-svelte-plugin"
  use "digitaltoad/vim-pug"

  -- utils
  use "ntpeters/vim-better-whitespace"
  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use "tpope/vim-abolish"
  use "godlygeek/tabular"                   -- align columns of text
  use "AndrewRadev/splitjoin.vim"

  -- navigation plugins
  use {
    "phaazon/hop.nvim",
    branch = "v1.2",
    cmd = {
      "HopWord",
      "HopLine",
      "HopLineStart",
      "HopChar1",
      "HopChar2",
      "HopePattern",
    },
    config = function()
      require("user.plugin_configs.hop").setup()
    end,
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
