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

" chercher fzf.vim pour faire de la rechercher dans projet 
call plug#begin()
"Linter  
Plug 'w0rp/ale'
" nvim atom color scheme
Plug 'joshdick/onedark.vim'
" Latex on vim, require latexmk 
Plug 'lervag/vimtex'
" completion, need adding each language
" require neovim from pip3
Plug 'roxma/nvim-completion-manager'
" Command usin leader c leader
Plug 'scrooloose/nerdcommenter'
" Snippet autocomplete 
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" syntax and indentation for many languages 
Plug 'sheerun/vim-polyglot'
" auto double for quote and brackets 
Plug 'jiangmiao/auto-pairs'
call plug#end()

set showcmd
colorscheme onedark
" Enable 24 bits colors
set termguicolors
" un highlight on press esc 
nnoremap <esc> :noh<return><esc>

" snippet mapping to ctrl s
imap <C-s>     <Plug>(neosnippet_expand_or_jump)
smap <C-s>     <Plug>(neosnippet_expand_or_jump)
xmap <C-s>     <Plug>(neosnippet_expand_target)

" Autodetect tex filetype
autocmd BufNewFile,BufRead *.tex set ft=tex

" Tab to choose autocompletion value
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" latexmk configuration for nvim and output dir 
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
" disapble polyglot for vim-latex (not working)
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

