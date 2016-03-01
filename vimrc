" sets , to leader key
let mapleader = ","

" toggles paste mode
set pastetoggle=<leader>p

" enable line numbers,
set number

" set visual bell
set vb

" allows cursor to be past the end of a line
" set virtualedit=all

" typing jk leaves insert mode, deletes all trailing spaces, and saves
imap jk <esc>`^:%s/ \+$//eg<return>`^:w<return>
imap JK jk
imap Jk jk
imap jK jk


" use 4 spaces for indention
" autoindent indents to previous line
" tabstop sets number of spaces in a tab
" shiftwidth controls how many columns text is indented with << and >>
" expandtab uses spaces instead of tab characters
" softtabstop makes it so backspace works over 4 space sequences
set expandtab autoindent tabstop=4 shiftwidth=4 softtabstop=4

" list makes whitespace characters visible
set list
" listchars determines what characters to use for whitespace
set listchars=tab:>-,trail:.,extends:#,nbsp:.

" enables searching as you type the search string
set incsearch
" enables smart case in searches
set smartcase

" shows cursor position in the bottom right
set ruler

" showcmd shows you information about the current command in the bottom left
set showcmd

" start scrolling 8 lines from the top/bottom margin
set scrolloff=8
" start scrolling 15 columns from the side margin
set sidescrolloff=15
" scroll sideways 1 character at a time
set sidescroll=1

" reload files edited outside of vim
set autoread

" map w!! to save with sudo
cmap w!! w !sudo tee % >/dev/null

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set markdown syntax for *.md files
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Do not expand tabs to spaces in makefiles
autocmd FileType make setlocal noexpandtab

" Automatic indenting based on file type
filetype plugin indent on

" set ; to :
nnoremap ; :

" vim-plug plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'

call plug#end()
