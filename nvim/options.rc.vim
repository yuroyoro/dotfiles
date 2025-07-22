"-------------------------------------------------------------------------------
" Basics
"-------------------------------------------------------------------------------

set textwidth=0               " don't insert linebreak when insert a long line
set autoread                  " reload the file if other process updates it
set hidden                    " buffer becomes hidden when it is abandoned
set formatoptions=jlmB        " formatting behaivior. disable auto comment insertion etc. see fo-table
set vb t_vb=                  " disable beep
set whichwrap=b,s,h,l,<,>,[,] " Allow to the cursor to move over the next/prev line
" set nomodeline                " disable modeline
set notitle                   " 'Thanks for Flying Vim'
set noundofile                " avoid creating a undo file
set clipboard=unnamed         " put the yanked string into unnamed buffer(as system clipboard)
set wildmode=list:full        " command-line completion, list all matches and complete first match
set completeopt+=noinsert     " auto select first completion element
set autowrite                 " write files on fire :tag, ;make and other commands
set hlsearch                  " highlight matches

set backspace=indent,eol,start
" ensure cache dir
let $VIMTMP = expand('~/.cache/vim')

if !isdirectory(expand($VIMTMP))
  call mkdir(expand($VIMTMP), 'p')
endif

set directory=$VIMTMP
set backupdir=$VIMTMP

"-------------------------------------------------------------------------------
" Indentation
"-------------------------------------------------------------------------------

set autoindent
set smartindent  " smart autoindenting when starting a new line
set cindent      " enables automatic C program indenting
set tabstop=2 shiftwidth=2 softtabstop=0

filetype plugin indent on

"-------------------------------------------------------------------------------
" Apperance
"-------------------------------------------------------------------------------

set showmatch         " highlight bracket pairs
set number            " show line number
set list              " list mode. show tab as following charactor
set listchars=tab:>.,trail:_,extends:>,precedes:< " to use in 'list' mode
set display=uhex      " show unprintable charactor as hex string

" highlight FullWidth white space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"-------------------------------------------------------------------------------
" Colors
"-------------------------------------------------------------------------------

set termguicolors " 256 color
if &term == 'screen-256color'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
syntax enable

" Highlight the go 'error'
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

" Highlight the js colon at end of line
autocmd FileType javascript :highlight jsColonAtTail  cterm=underline ctermfg=lightblue guibg=darkgray
autocmd FileType javascript :match jsColonAtTail /:$/

"-------------------------------------------------------------------------------
" Cursor
"-------------------------------------------------------------------------------

set cursorline   " highlight current cursor line
set lazyredraw   " stop rendering duraing command executing

" highlight only the current window's cursor line
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline

   " cursor line highlight settings. (draw underline)
  autocmd VimEnter * highlight CursorLine gui=underline term=underline cterm=underline
augroup END


" change the current cursor line bgcolor when into insert mode
augroup vimrc_change_cursorline_color
  autocmd!
  autocmd InsertEnter * highlight CursorLine term=underline cterm=underline ctermbg=236 gui=underline guibg=#3d425b
  autocmd InsertLeave * highlight CursorLine term=underline cterm=underline ctermbg=235 gui=underline guibg=#1e2132
augroup END

"-------------------------------------------------------------------------------
" Searching
"-------------------------------------------------------------------------------

set ignorecase  " case insensitive search
set smartcase   " disable ignorecase if search word contains uppercase charactor

"-------------------------------------------------------------------------------
" Editing
"-------------------------------------------------------------------------------

" replace tab with whitespace
set expandtab

" drop the whitespaces at end of line
autocmd BufWritePre * :%s/\s\+$//ge

"-------------------------------------------------------------------------------
" Encoding
"-------------------------------------------------------------------------------
set ffs=unix,dos,mac
set encoding=utf-8
