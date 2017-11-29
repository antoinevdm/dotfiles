" ------ special commands 
"  :set spell for spell checking 
"  :PlugInstall / Update / Clean for plugin management 
"  :vimtexCompile for tex file compiling 

inoremap jj <ESC>
let mapleader = " " 
filetype plugin indent on
syntax on 
set encoding=utf-8 
set number

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

call plug#begin()
" Linter  
Plug 'w0rp/ale'
" Nvim atom color scheme
Plug 'joshdick/onedark.vim'
" Latex on vim, require latexmk 
Plug 'lervag/vimtex'
" Completion, need adding each language
" Require neovim from pip3
Plug 'roxma/nvim-completion-manager'
" Command usin leader c leader
Plug 'scrooloose/nerdcommenter'
" Snippet autocomplete 
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Syntax and indentation for many languages 
Plug 'sheerun/vim-polyglot'
" Auto double for quote and brackets 
Plug 'jiangmiao/auto-pairs'

" To instal 
" fzf vim to search in current folder, in each file 
call plug#end()

set showcmd
colorscheme onedark
" Enable 24 bits colors
set termguicolors
" Unhighlight on press esc 
nnoremap <esc> :noh<return><esc>

" Snippet mapping to ctrl s
imap <C-s>     <Plug>(neosnippet_expand_or_jump)
smap <C-s>     <Plug>(neosnippet_expand_or_jump)
xmap <C-s>     <Plug>(neosnippet_expand_target)

" Autodetect tex filetype
autocmd BufNewFile,BufRead *.tex set ft=tex

" Tab to choose autocompletion value
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Latexmk configuration for nvim and output dir 
let g:vimtex_compiler_latexmk = {
         \ 'backend' : 'nvim',
         \ 'background' : 1,
         \ 'build_dir' : '',
         \ 'callback' : 1,
         \ 'continuous' : 1,
         \ 'executable' : 'latexmk',
         \ 'options' : [
         \   '-pdf',
	 \   '-output-directory=output',
         \   '-verbose',
         \   '-file-line-error',
         \   '-synctex=1',
         \   '-interaction=nonstopmode',
         \ ],
	 \}

" Disapble polyglot for vim-latex (not working)
let g:polyglot_disabled = ['latex']
