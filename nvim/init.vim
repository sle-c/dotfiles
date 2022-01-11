source ~/.config/nvim/plug.vim
source ~/.config/nvim/maps.vim

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme tokyonight
" colorscheme github_dark

" open new split panes to right and below
set splitright
set splitbelow

" Misc settings
set cmdheight=2
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set tabstop=2     " Soft tab
set shiftwidth=2
set shiftround
set expandtab

" Numbers
set number
set numberwidth=5
set relativenumber   " Relative line number

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Stripe whitespace on save
autocmd BufWritePre * StripWhitespace
set autoread

" Use one space, not two, after punctuation.
set nojoinspaces

" Faster escape
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" set guifont=DroidSansMono\ Nerd\ Font:h16
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
