" Enable syntax highlighting
syntax on

" Enable line numbers
set number

" Status bar
set laststatus=2

" 256 colors
set t_Co=256


call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:deoplete#enable_at_startup = 1

map <F5> <Esc>:w<CR>:!./%<CR>

