" ------ special commands
"  :set spell for spell checking
"  :setlocal spell spelllang=en_us for local language change
"  :PlugInstall / Update / Clean for plugin management
"  :vimtexCompile for tex file compiling
"  vim-dirvish aller voir ! pour parcourir les fichers faciellement avec tiret
inoremap jj <ESC>
let mapleader = " "
filetype plugin indent on
syntax on
set encoding=utf-8
set number
set spell spelllang=en_us
set cursorline
set colorcolumn=120
set mouse=a

" tab management
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set nobackup noswapfile
" Unhighlight on press esc
nnoremap <esc> :noh<return><esc>
nnoremap & :w<return>:VimtexCompileSS<return>
nnoremap <return> o<esc>
nnoremap 1w :call cursor(0, len(getline('.'))/2)<return>
nnoremap ^$ :call cursor(0, 120)<return>

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> :w<return>:bNext<return>
nnoremap <right> :w<return>:bnext<return>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

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
Plug 'davidhalter/jedi'
" Command usin leader c leader
Plug 'scrooloose/nerdcommenter'
" Snippet autocomplete
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Syntax and indentation for many languages
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'sheerun/vim-polyglot'
" Auto double for quote and brackets
Plug 'jiangmiao/auto-pairs'
" Change surronding with cs( par example
Plug 'tpope/vim-surround'
" Path navigator
Plug 'justinmk/vim-dirvish'
" Vim centering not distraction mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Bufffer visualization
Plug 'bling/vim-bufferline'
" To instal
" fzf vim to search in current folder, in each file
call plug#end()

set showcmd
colorscheme onedark
" Enable 24 bits colors
set termguicolors

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

" Remove trailing whitespace and restore cursor position
function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

