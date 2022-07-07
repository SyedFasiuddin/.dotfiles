set number relativenumber   
set visualbell noerrorbells

set nocompatible
set encoding=utf-8
set fileencoding=utf-8

" General tab settings
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tabs to spaces so that tabs are spaces
set smarttab

set cursorline      " highlight the line on which cursor is present

set colorcolumn=80  " right color column for 80 characters 

" splitting the windows as I like it: on to the right and bottom
set splitright splitbelow

" minimum number of line to keep above and below while scrolling
set scrolloff=5



call plug#begin('~/.vim/plugged')   " vim plug

" themes
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'sainnhe/everforest'

" status line
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" code completion 
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" :CocInstall coc-tsserver coc-json coc-css coc-html coc-markdownlint
" :CocInstall coc-clangd and then :CocCommand clangd.install

" for commenting and uncommenting 
" Plug 'preservim/nerdcommenter'

call plug#end()

" remaping bcoz esc is far to reach
inoremap jj <Esc>

" setting theme  
syntax enable           " synatx highlighting
filetype plugin on 
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_termcolors =  256
set bg=dark
colorscheme gruvbox8_hard 
" transparent bg
hi Normal guibg=NONE ctermbg=NONE
let g:airline_theme = 'gruvbox8'


" Custom statusline
" set laststatus=2        " to display statusline 
" set statusline=
" set statusline+=\ %f    " relative file name
" set statusline+=\ %M    " file modified or not
" set statusline+=\%=     " right side separator
" set statusline+=\ %L    " total number of line in file
" set statusline+=\ [%n]  " buffer number enclosed in brackets 
 
let mapleader=","
let g:NERDSpaceDelims = 1
set showcmd             " what command is typed is showed in rightside

" movements remaping for normal mode
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" map <C-Tab> :bnext<cr>    " not working


" Set matching pairs of characters and highlight matching brackets
" set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

set linebreak
set showbreak=↪         " character to show before the line that have been soft-wrapped


