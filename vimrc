" Leader
let mapleader = " "

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
set re=1          " Use old regex engine
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s --ignore "vendor/"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Numbers
set number
set numberwidth=5

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
" function! EchoStrategy(cmd)
"   echo 'It works! Command for running tests: ' . a:cmd
"   silent exec "!(echo 'hello. I'm a process :)') > /tmp/vim_process" | :vs /tmp/vim_process
" endfunction
"
" let g:test#custom_strategies = {'echo': function('EchoStrategy')}
" let g:test#strategy = 'echo'

nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<Space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Always use vertical diffs
set diffopt+=vertical

" My own Custom Settings
set relativenumber
set background=dark
colorscheme onedark
let g:airline_theme='tender'
let g:airline_powerline_fonts = 1

" Stripe whitespace on save
autocmd BufWritePre * StripWhitespace

" Mappings
nnoremap <silent> <Leader>yy :.w !pbcopy<CR><CR>
vnoremap <silent> <Leader>yy :w !pbcopy<CR><CR>
nnoremap <silent> <Leader>nh :set nohlsearch<CR>
nnoremap <silent> <Leader>h :set hlsearch<CR>

set grepprg=ag

let g:jsx_ext_required = 0
let g:grep_cmd_opts = '--line-numbers --noheading'

autocmd FileType eruby.yaml setlocal ts=2 sts=2 sw=2 expandtab indentexpr= autoindent

" overwrite ctrl l in netrw
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  noremap <buffer> <C-l> <C-w>l
endfunction

" fix the SLOOOW syntax highlighting
augroup ft_rb
  au!
  au FileType ruby setlocal re=1 foldmethod=manual
augroup END

" Config vim go goimport
let g:go_fmt_command = "goimports"
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_enabled = ['vet', 'errcheck']
let g:go_metalinter_disabled = ['golint']

" ALE golangci-lint
let g:ale_linters = { 'go': ['gofmt', 'govet', 'golangci-lint'] }

" Vim-mucomplete settings
set completeopt+=menuone
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1

