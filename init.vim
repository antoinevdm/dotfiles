inoremap jj <ESC>
let mapleader = " " 
filetype plugin indent on
syntax on 
set encoding=utf-8 
set number

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'w0rp/ale'
Plug 'joshdick/onedark.vim'
call plug#end()

set showcmd
colorscheme onedark
" Enable 24 bits colors
set termguicolors
