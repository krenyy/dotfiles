" Enable syntax highlighting
syntax on

" Hidden buffer
set hidden

" Enable line numbers
set number
set relativenumber

" Expand tab to 2 spaces
set tabstop=2 shiftwidth=2 expandtab

" Status bar
set laststatus=2

" Message height
set cmdheight=2

" Indentation
filetype indent on
set autoindent
set smartindent

" Terminal colors
set termguicolors

" Plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug 'mattn/emmet-vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/lsp-trouble.nvim'
"Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
Plug 'Raimondi/delimitMate'
Plug 'chrisbra/csv.vim'
Plug 'luochen1990/rainbow'

Plug 'joshdick/onedark.vim'

call plug#end()

"-------
" Theme
"-------

" set color scheme
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
colorscheme onedark

" rainbow brackets
let g:rainbow_active = 1

luafile ~/.config/nvim/config/lua/lspconfig.lua
luafile ~/.config/nvim/config/lua/treesitter.lua
luafile ~/.config/nvim/config/lua/compe.lua
luafile ~/.config/nvim/config/lua/bufferline.lua
luafile ~/.config/nvim/config/lua/lsp_signature.lua
luafile ~/.config/nvim/config/lua/lspsaga.lua
luafile ~/.config/nvim/config/lua/lspkind.lua

source ~/.config/nvim/config/vimscript/lspconfig.vim
source ~/.config/nvim/config/vimscript/clipboard.vim
source ~/.config/nvim/config/vimscript/compe.vim
source ~/.config/nvim/config/vimscript/bufferline.vim
source ~/.config/nvim/config/vimscript/tree.vim
source ~/.config/nvim/config/vimscript/lspsaga.vim
source ~/.config/nvim/config/vimscript/trouble.vim
source ~/.config/nvim/config/vimscript/vsnip.vim
source ~/.config/nvim/config/vimscript/ultisnips.vim

