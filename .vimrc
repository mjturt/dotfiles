"┃ ~/.vimrc
"┣━━━━━━━━━
"┃ mjturt

"---------------"
" Figure out OS "
"---------------"

let os = ""
if has("unix")
   let g:uname = substitute(system("uname"), '\n\+$', '', '')
   if g:uname == "Linux"
      let os="linux"
   elseif g:uname == "FreeBSD"
      let os="freebsd"
   elseif g:uname == "Darwin"
      let os="macos"
   endif
elseif has("win32")
   let os = "windows"
endif

"----------------"
" Basic settings "
"----------------"

syntax on
filetype plugin indent on
set nocompatible
set encoding=utf-8

set ruler
set showmatch
"set nowrap
set hlsearch
set noshowmode
set list listchars=tab:∙\ ,extends:,precedes:
set hidden
set shortmess=atI
set laststatus=2

set number relativenumber

set ttyfast
set mouse=a
set showcmd
set title
set report=0
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set autoread
set autochdir
set clipboard=unnamedplus
set lazyredraw
set ttimeoutlen=50

set incsearch
set ignorecase
set smartcase

set nofoldenable
set foldmethod=indent

set expandtab
set shiftwidth=3
set softtabstop=3
set smarttab
"set tabstop=3

set autoindent
"set copyindent
set smartindent

set sidescroll=40
set scrolloff=3

set backupdir=~/.vim/temp/backup
set directory=~/.vim/temp/swap
set undodir=~/.vim/temp/undo
set backup
set noswapfile
set undofile

if os=="freebsd"
   let g:python3_host_prog="/usr/local/bin/python3.6"
endif

autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd VimLeave * call system("xsel -ib", getreg('+'))

set omnifunc=syntaxcomplete#Complete

"-------------------"
" Filetype settings "
"-------------------"

autocmd FileType java setlocal omnifunc=javacomplete#Complete

autocmd BufReadPost *.doc silent %!antiword "%" 
autocmd BufWriteCmd *.doc set readonly
autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"
autocmd BufWriteCmd *.odt set readonly
autocmd BufReadPost *.pdf  silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78
autocmd BufWriteCmd *.pdf set readonly
autocmd BufReadPost *.rtf silent %!unrtf --text "%"
autocmd BufWriteCmd *.rtf set readonly

"--------------"
" GUI-settings "
"--------------" 

if has("gui_running")
   if has("gui_gtk2") || has("gui_gtk3")
      set guifont=ShureTechMono\ Nerd\ Font\ Mono\ 10
   endif
endif

"-------------"
" Other parts "
"-------------"

source $HOME/.vim/plugins.vim
source $HOME/.vim/appearance.vim
source $HOME/.vim/keybindings.vim
source $HOME/.vim/functions.vim
" Projects for Syntastic
source $HOME/.vim/projects.vim
