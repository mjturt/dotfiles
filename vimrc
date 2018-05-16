" vimrc  
" ------
" mjturt 

"-------------------
" VIM-Plug install |
"-------------------

if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"----------
" Plugins |
"----------

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs' 
Plug 'Xuyuanp/nerdtree-git-plugin'

" Completion / Syntax
Plug 'maralla/completor.vim'
Plug 'ervandew/supertab'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'shawncplus/phpcomplete.vim'
Plug 'vim-syntastic/syntastic'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ricpelo/vim-gdscript'
Plug 'ap/vim-css-color'

" Automation
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-surround'

" Interface
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'farmergreg/vim-lastplace'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-eunuch'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'xolox/vim-colorscheme-switcher'

" Color themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'

" Not in use
"Plug 'gcavallanti/vim-noscrollbar'
"Plug 'jszakmeister/vim-togglecursor'
"Plug 'michaeljsmith/vim-indent-object'
"Plug 'majutsushi/tagbar'
"Plug 'godlygeek/tabular'

call plug#end()

"-----------
" Settings |
"-----------

syntax on
filetype plugin indent on
set nocompatible
set encoding=utf-8

set cursorline
set cursorcolumn
set ruler
set number
set showmatch
set nowrap
set hlsearch
set noshowmode
set list listchars=tab:∙\ ,extends:▶,precedes:◀

set ttyfast
set mouse=a
set showcmd
set title
set noswapfile
set report=0
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set autoread
set autochdir
set clipboard=unnamedplus

set incsearch
set ignorecase
set smartcase

set nofoldenable
set foldmethod=indent

set autoindent
set copyindent
"set smartindent
set tabstop=3
set softtabstop=3
set shiftwidth=3
set smarttab
set expandtab

set sidescroll=40
set scrolloff=12

autocmd! bufwritepost .vimrc source ~/.vimrc

autocmd VimLeave * call system("xsel -ib", getreg('+'))

set backupdir=~/.vim/temp/backup
set directory=~/.vim/temp/swap
try
   set undodir=~/.vim/temp/undo
   set undofile
catch
endtry

"---------
" Colors |
"---------

"color molokai
"color PaperColor
color dracula

set background=dark
hi Normal guibg=NONE ctermbg=NONE
hi CursorLine  cterm=NONE ctermbg=236 ctermfg=NONE
hi CursorColumn  ctermbg=236 ctermfg=NONE
hi Visual ctermbg=3 ctermfg=0
autocmd InsertEnter * highlight CursorColumn ctermbg=22 ctermfg=NONE
autocmd InsertLeave * highlight CursorColumn ctermbg=236 ctermfg=NONE

" Cursor color settings

if &term =~ "xterm\\|rxvt-unicode-256color"
   let &t_SI = "\<Esc>]12;Green\x7"
   let &t_EI = "\<Esc>]12;DarkCyan\x7"
   let &t_SR = "\<Esc>]12;Red\x7"
   let &t_EI .= "\<Esc>[1 q"
   let &t_SR .= "\<Esc>[4 q"
   let &t_SI .= "\<Esc>[5 q"
"   autocmd VimLeave * silent execute "!echo -en \<esc>[3 q"
endif

" Completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete


"------------------
" Plugin settings |
"------------------

let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z = ' %p%%  %l/%L  %v'
set ttimeoutlen=50

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''
let g:nerdtree_tabs_open_on_gui_startup=2

let g:SuperTabDefaultCompletionType = "<c-n>"

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:colorscheme_switcher_define_mappings = 0

let g:ctrlp_cmd = 'CtrlPBuffer'

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

let g:syntastic_c_remove_include_errors = 1

"Projects for syntastic
let g:syntastic_java_javac_classpath = "~/cloud/dev/java/oopHarjoitustyo/dungeons-of-rantamaki/src"
let g:syntastic_c_include_dirs = ['/home/mjt/cloud/dz60/qmk_firmware/keyboards/dz60/']

"---------------
" GUI-settings |
"--------------- 

if has("gui_running")
   if has("gui_gtk2") || has("gui_gtk3")
      set guifont=ShureTechMono\ Nerd\ Font\ Mono\ 10
   endif
endif

"--------------------
" Keyboard mappings |
"--------------------

let mapleader="'"
"set pastetoggle=<F3>
map! <C-J> <Esc>
vnoremap <C-J> <Esc>
nmap <C-o> o<Esc>
map <S-j> gT
map <S-k> gt
map <C-j> :bprevious<CR>
map <C-k> :bnext<CR>
vmap <C-c> y
nmap <leader>/ :nohl<CR>
nnoremap <leader>n :set number!<cr>
nnoremap <silent> <Leader><Up> :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader><Down> :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader><Right> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader><Left> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <leader>ev <C-w><C-s><C-l>:e ~/.vimrc<CR>
noremap <silent> <Leader>w :call ToggleWrap()<CR>
noremap <Leader>gg gg=G
cmap Q q
cmap W w
"cmap qw wq
nmap QQ :wq<CR>

map <F5> :call CompileRunGcc()<CR>

" Mappings for plugins

nmap <F12> :TagbarToggle<CR>
map <F2> <plug>NERDTreeTabsToggle<CR>
nmap <F11> :RandomColorScheme<CR>
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)

"------------
" Functions |
"------------

" Compiler

func! CompileRunGcc()
   exec"w"
   if &filetype == 'c'
      exec "!gcc % -o %<"
      exec "!time ./%<"
   elseif &filetype == 'cpp'
      exec "!g++ % -o %<"
      exec "!time ./%<"
   elseif &filetype == 'java'
      exec "!javac %"
      exec "!time java -cp %:p:h %:t:r"
   elseif &filetype == 'sh'
      exec "!time bash %"
   elseif &filetype == 'python'
      exec "!time python %"
   elseif &filetype == 'html'
      exec "!firefox % &"
   elseif &filetype == 'go'
      exec "!go build %<"
      exec "!time go run %"
   endif
endfunc

" ToggleWrap

func! ToggleWrap()
   if &wrap
      echo "Wrap OFF"
      setlocal nowrap
      set virtualedit=all
      silent! nunmap <buffer> <Up>
      silent! nunmap <buffer> <Down>
      silent! nunmap <buffer> <Home>
      silent! nunmap <buffer> <End>
      silent! iunmap <buffer> <Up>
      silent! iunmap <buffer> <Down>
      silent! iunmap <buffer> <Home>
      silent! iunmap <buffer> <End>
   else
      echo "Wrap ON"
      setlocal wrap linebreak nolist
      set virtualedit=
      setlocal display+=lastline
      noremap  <buffer> <silent> <Up>   gk
      noremap  <buffer> <silent> <Down> gj
      noremap  <buffer> <silent> <Home> g<Home>
      noremap  <buffer> <silent> <End>  g<End>
      inoremap <buffer> <silent> <Up>   <C-o>gk
      inoremap <buffer> <silent> <Down> <C-o>gj
      inoremap <buffer> <silent> <Home> <C-o>g<Home>
      inoremap <buffer> <silent> <End>  <C-o>g<End>
   endif
endfunction
