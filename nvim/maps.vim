" Leader
let mapleader = " "

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Mappings
" Copy to clipboard
" setting clipboard to unnamed will enable global copy and paste in vim
" which means if I copy something from outside,
" it'll override vim's copy register too
" set clipboard=unnamed
" bind keys to be more explicit
nnoremap <silent> <Leader>yy "+yy
noremap <silent> <Leader>y "*y
nnoremap <Leader>c :let @+ = expand("%")<CR>
nnoremap <Leader>cp :let @+ = expand("%:p")<CR>
nnoremap <Leader>cl :let @+ = expand("%").':'.line(".")<CR>
nnoremap <Leader>cL :let @+ = expand("%:p").':'.line(".")<CR>

" Utils mappings
nnoremap <silent> <Leader>nh :set nohlsearch<CR>
nnoremap <silent> <Leader>h :set hlsearch<CR>
nnoremap <silent> <Leader>p :set paste<CR>
nnoremap <silent> <Leader>np :set nopaste<CR>
