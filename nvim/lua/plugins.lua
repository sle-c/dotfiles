-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'dense-analysis/ale',
    ft = {
      'sh',
      'zsh',
      'bash',
      'c',
      'cpp',
      'cmake',
      'html',
      'markdown',
      'vim',
      'tex',
      'ruby',
      'typescript',
      'javascript',
    },
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Language and syntax
  -- Post-install/update hook with neovim command
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('treesitter_settings').setup()
    end
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {
    'neovim/nvim-lspconfig',
    config = function()
    end
  }
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      require('lsp_installer_conf').setup()
    end,
  }
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'glepnir/lspsaga.nvim',
    config = function()
      require('lspsaga_settings').setup()
    end,
  }


  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns_settings').setup()
    end,
    event = 'BufRead'
  }

  -- utils
  use 'tpope/vim-endwise'
  use 'tpope/vim-surround'
  use '9mm/vim-closer'
  use 'ryanoasis/vim-devicons'
  use 'ntpeters/vim-better-whitespace'
  use 'tpope/vim-sensible'
  use 'tpope/vim-repeat'
  use 'Yggdroot/indentLine'

  -- status line
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine_config').setup()
    end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- Color scheme
  use 'folke/tokyonight.nvim'

  -- fzf
  use {
    'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end
  }
  use 'junegunn/fzf.vim'

  -- autocomplete
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("cmp_defaults").setup()
    end,
  }

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"

  -- file tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
      require('nvim_tree_conf').setup()
    end
  }
end)
