call plug#begin()
  " Nvim specific
  if has("nvim")
    " Enable common lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'

    " Telescope setup
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'

    " Statusline
    Plug 'hoob3rt/lualine.nvim'

    " Filetree
    Plug 'kyazdani42/nvim-tree.lua'

    " Git sign
    Plug 'lewis6991/gitsigns.nvim'

    " autocomplete
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'

    " Defx
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'kristijanhusak/defx-icons'

    " Icon set
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'

    Plug 'AndrewRadev/splitjoin.vim'
  endif

  " Dracular theme
  Plug 'projekt0n/github-nvim-theme'

  " TokyoNight
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

  " Ruby and rails
  Plug 'tpope/vim-rails'
  " Plug 'vim-ruby/vim-ruby'

  " Utils
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'yggdroot/indentline'
  Plug 'ntpeters/vim-better-whitespace'
  " Want to turn fooBar into foo_bar? Press crs (coerce to snake_case).
  " MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru),
  " dash-case (cr-), dot.case (cr.)
  " space case (cr<space>), and Title Case (crt) are all just 3 keystrokes away.
  Plug 'tpope/vim-abolish'

  " fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " One off coffeescript
  Plug 'kchmck/vim-coffee-script'

  " debugger
  Plug 'puremourning/vimspector'

  " linter
  Plug 'dense-analysis/ale'
call plug#end()
