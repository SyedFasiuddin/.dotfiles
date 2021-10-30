set number
set relativenumber

set nocompatible
set encoding=utf-8
set noerrorbells

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set cursorline

set colorcolumn=80
syntax on

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'preservim/nerdcommenter'

call plug#end()

inoremap jj <Esc>

let g:gruvbox_contrast_darl = 'hard'
let g:gruvbox_termcolors = 256
set bg=dark
colorscheme gruvbox8_hard

