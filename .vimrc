" setting numbers
set number
set relativenumber

set nocompatible
set encoding=utf-8
set noerrorbells

" for tabs
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

" highlight the line on which cursor is present
set cursorline

" column on rightside 
set colorcolumn=80

" synatx highlighting
syntax on

" using Plug as the plugin manager
call plug#begin('~/.vim/plugged')

" themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'

" status line
Plug 'vim-airline/vim-airline'

" for code completion
" install coc.json and coc.tsserver
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" for commenting and uncommenting 
Plug 'preservim/nerdcommenter'

call plug#end()

" remaping bcoz esc is far to reach
inoremap jj <Esc>

" setting theme  
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_termcolors =  256
set bg=dark
colorscheme gruvbox8_hard
