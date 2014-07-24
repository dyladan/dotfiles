set nocompatible
"filetype plugin on


filetype off " required! for vundle

" filetype plugin on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" required! for vundle
Bundle 'gmarik/vundle'

" language support:
Bundle 'tpope/vim-rails'
Bundle 'xhr/vim-io'
Bundle 'vim-ruby/vim-ruby'
Bundle 'derekwyatt/vim-scala'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'msp.vim'
Bundle 'slim-template/vim-slim'
Bundle 'jtratner/vim-flavored-markdown'

Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Townk/vim-autoclose'
" Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'kien/ctrlp.vim'

nmap <leader>b <leader>r:BundleInstall<return>

syntax on

set number
set vb
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set list
set listchars=tab:..,trail:.,extends:#,nbsp:.
set history=100 " keep 100 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


set virtualedit=all
set hidden
set smartcase
set autoread

" set colorcolumn=80

set pastetoggle=<leader>p

set mouse=a
set clipboard=unnamed

let g:indent_guides_enable_on_vim_startup = 1

let g:ctrlp_follow_symlinks=1

nmap n nzz
nmap N Nzz
cmap w!! w !sudo tee % >/dev/null

imap jk <esc>`^:%s/ \+$//eg<return>`^:w<return>
imap JK jk
imap Jk jk
imap jK jk


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>v mqHmw<C-w>v`wzt`q<C-w>l`q
nnoremap <leader>s mqHmw<C-w>s`wzt`q<C-w>j`q

nnoremap <leader>= <C-w>=

nnoremap <leader>l >>
nnoremap <leader>h <<

nnoremap <leader>z zf}

nnoremap <leader>n :NERDTree<return>
nnoremap <leader>H :so $VIMRUNTIME/syntax/hitest.vim<return>

nnoremap <leader>w :w<return>
nnoremap <leader>q :q<return>

nnoremap gn gt
nnoremap gp gT

nnoremap <leader>r :source $MYVIMRC<return>
nnoremap <leader>R :call ReloadAllSnippets()<return>

nnoremap <leader>t :Tabularize /
nnoremap <leader>m :Tabularize /=<return>`^

:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

map ; :
noremap ;; ;
map , <leader>

let g:EasyMotion_leader_key = ',,'
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber


"."."."."." Solarized "."."."."."


" let g:indent_guides_auto_colors = 0
" let g:indent_guides_color_change_percent = 0

" set background=light
" let g:solarized_underline  = 1
" let g:solarized_italic     = 1
" let g:solarized_termcolors = 16
" " let g:solarized_degrade    = 1
" let g:solarized_contrast   = 'normal'
" let g:solarized_visibility = 'normal'

set statusline=%L\ %03v\ %=%<%r%F\ %h%m%y
set laststatus=2

set cursorline

set background=dark

hi ColorColumn ctermbg=7
hi ColorColumn guibg=Gray
" colorscheme solarized

hi slcolumn         cterm=NONE ctermbg=red      ctermfg=black
hi StatusLineNC     cterm=NONE ctermbg=darkcyan ctermfg=white
hi StatusLine       cterm=NONE ctermbg=darkred  ctermfg=yellow
hi CursorLine       cterm=NONE ctermbg=NONE
hi CursorLineNr     cterm=NONE ctermbg=darkred  ctermfg=yellow guibg=darkred ctermfg=yellow
hi LineNr           cterm=NONE ctermbg=yellow   ctermfg=darkcyan
hi Visual           cterm=NONE ctermbg=magenta  ctermfg=lightmagenta
hi MatchParen       cterm=NONE ctermbg=NONE     ctermfg=darkred
hi Directory        cterm=NONE ctermbg=NONE     ctermfg=magenta
hi NERDTreeDirSlash cterm=NONE ctermbg=NONE     ctermfg=darkblue
hi NERDTreeCWD      cterm=NONE ctermbg=NONE     ctermfg=red
" hi IndentGuidesOdd ctermbg=darkred


set backspace=indent,eol,start " allow backspacing over everything in insert mode


set backupdir=~/.vimtmp/,.
set directory=~/.vimtmp/,.
set nobackup
set noswapfile

" set hlsearch  " hilight search results

" PRINTING """""""""""""""""""""""""""""""""""

set printoptions=number:y,duplex:off,paper:letter,left:0pt


" Don't use Ex mode, use Q for formatting
map Q gq


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" au BufRead,BufNewFile *.scss set filetype=scss
autocmd BufRead,BufNewFile *.skim set filetype=slim
autocmd BufRead,BufNewFile *.s43 set filetype=msp

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup ENDutocmd CursorHold * checktime

" comment strings
set commentstring=//\ %s
autocmd FileType ruby     set commentstring=#\ %s
autocmd FileType php      set commentstring=#\ %s
autocmd FileType java     set commentstring=//\ %s
autocmd FileType vim      set commentstring=\"\ %s
autocmd FileType sh       set commentstring=#\ %s
autocmd FileType asm      set commentstring=;\ %s
autocmd FileType css      set commentstring=//\ %s
autocmd FileType scss.css set commentstring=//\ %s
autocmd FileType coffee   set commentstring=#\ %s
autocmd FileType c        set commentstring=//\ %s
autocmd FileType io       set commentstring=//\ %s

set undofile
set undodir=$HOME/.vim/undo
autocmd FileType make setlocal noexpandtab
