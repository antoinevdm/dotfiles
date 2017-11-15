inoremap jj <ESC>
let mapleader = " " 
filetype plugin indent on
syntax on 
set encoding=utf-8 

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'w0rp/ale'
call plug#end()

set showcmd
