" sets , to leader key
let mapleader = ","

set nocompatible
set nobackup
set nowritebackup
set noswapfile

" remove all existing autocmds
autocmd!

set clipboard=unnamed

" toggles paste mode
set pastetoggle=<leader>p

" run current file in python
nnoremap <leader>rp :!python %<cr>
nnoremap <leader>rj :!npm start<cr>

nnoremap <leader>q :q<cr>
nnoremap <leader>l :!eslint %<cr>
nnoremap <leader><leader> :!%:p<cr>

nnoremap <leader>s :split<cr><c-w>j
nnoremap <leader>vs :vsp<cr><c-w>l

nnoremap <leader>gi :!ghi<cr>

" enable line numbers,
set number

" set visual bell
set vb

" typing jk leaves insert mode, deletes all trailing spaces, and saves
imap jk <esc>`^:%s/ \+$//eg<return>`^:w<return>
imap KJ jk
imap Kj jk
imap kJ jk

" moving up and down moves by display lines rather than actual lines
nnoremap j gj
nnoremap k gk

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" use 2 spaces for indention
" autoindent indents to previous line
" tabstop sets number of spaces in a tab
" shiftwidth controls how many columns text is indented with << and >>
" expandtab uses spaces instead of tab characters
" softtabstop makes it so backspace works over 4 space sequences
set expandtab autoindent tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType javascript setlocal ts=2 sw=2 sts=2
autocmd FileType typescript setlocal ts=2 sw=2 sts=2
autocmd FileType json setlocal ts=2 sw=2 sts=2
autocmd FileType python setlocal ts=4 sw=4 sts=4
autocmd FileType markdown setlocal ts=2 sw=2 sts=2
autocmd FileType yaml setlocal ts=2 sw=2 sts=2
autocmd FileType make setlocal noexpandtab

" set markdown syntax for *.md files
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead .git/GHI_ISSUE set filetype=markdown
autocmd BufNewFile,BufRead *.ts set filetype=typescript

" Add formatting for jk on markdown files
autocmd FileType markdown inoremap <buffer> JK <esc>`^gq}:%s/ \+$//eg<return>`^:w<return>

" syntastic eslint settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'eslint @%'
let g:syntastic_javascript_eslint_exe = 'npx eslint @%'

function! s:auto_goyo()
  if &ft == 'markdown'
    Goyo 80
  else
    let bufnr = bufnr('%')
    Goyo!
    execute 'b '.bufnr
  endif
endfunction

augroup goyo_markdown
  autocmd!
  autocmd BufNewFile,BufRead * call s:auto_goyo()
augroup END

" list makes whitespace characters visible
" listchars determines what characters to use for whitespace
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.

" searching as you type the search string
" smart case in searches
set incsearch ignorecase smartcase

" shows cursor position in the bottom right
set ruler

" showcmd shows you information about the current command in the bottom left
set showcmd

" disable automatic fold
set foldmethod=manual
set nofoldenable

" automatically reload files changed outside vim
set autoread

" start scrolling 8 lines from the top/bottom margin
" start scrolling 15 columns from the side margin
" scroll sideways 1 character at a time
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" reload files edited outside of vim
set autoread

" map w!! to save with sudo
cmap w!! w !sudo tee % >/dev/null

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


" Automatic indenting based on file type
filetype plugin indent on

" set ; to :
nnoremap ; :

syntax on

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if executable('rg')
    "Use ripgrep over grep
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:rg_command = '
                \ rg --column  --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
                \ -g "*.{js,jsonhp,md,styl,jade,html,configy,cpp,c,go,hs,rb,conf}"
                \ -g "!{.git,node_modules,vendor}/*" '
    command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
endif


:command -nargs=1 InstallPlugin ! cd ~/.vimplugins && git clone <args>

" Resize splits like a boss
" http://flaviusim.com/blog/resizing-vim-window-splits-like-a-boss/
"set winheight=10
"set winminheight=10
"let &winheight = &lines - 10
"set winwidth=40
":silent! set winminwidth=40       " E36 Not enough room here
"let &winwidth = &columns - 40

set wildmenu

set wildignore+=*/node_modules   " ignores node_modules
set wildignore+=*/coverage   " ignores node_modules
set wildignore+=**/*.app/**/*   " ignores node_modules

" hilight lines longer than 100
highlight OverLength ctermbg=black ctermfg=white guibg=#592929asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfsdfasdfsdfasdisdi
match OverLength /\%101v.\+/

call plug#begin()

Plug 'wincent/command-t'
Plug 'tpope/vim-surround'
Plug 'moll/vim-node'
Plug 'airblade/vim-gitgutter'
Plug 'jelera/vim-javascript-syntax'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'leafgarland/typescript-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'

call plug#end()
