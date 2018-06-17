" ~/.vimrc  
" --------
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

" Completion
Plug 'maralla/completor.vim'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'shawncplus/phpcomplete.vim'

" Syntax
Plug 'vim-syntastic/syntastic'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ricpelo/vim-gdscript'
Plug 'ap/vim-css-color'
Plug 'tmux-plugins/vim-tmux'

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
Plug 'google/vim-searchindex'
Plug 'lilydjwg/colorizer'

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

"set cursorline
"set cursorcolumn
set ruler
set showmatch
set nowrap
set hlsearch
set noshowmode
set list listchars=tab:∙\ ,extends:▶,precedes:◀
set hidden
set shortmess=atI

set number relativenumber
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber

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
set lazyredraw

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

autocmd! bufwritepost .vimrc source ~/.vimrc

autocmd VimLeave * call system("xsel -ib", getreg('+'))

set titlestring=%(\ %M%)%(\ %F%)%a\ -\ 

set backupdir=~/.vim/temp/backup
set directory=~/.vim/temp/swap
try
   set undodir=~/.vim/temp/undo
   set undofile
catch
endtry

" Completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete

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

" Cursor color and shape settings

if &term =~ "xterm\\|rxvt-unicode-256color"
   let &t_SI = "\<Esc>]12;Green\x7"
   let &t_EI = "\<Esc>]12;DarkCyan\x7"
   let &t_SR = "\<Esc>]12;Red\x7"
   let &t_EI .= "\<Esc>[1 q"
   let &t_SR .= "\<Esc>[4 q"
   let &t_SI .= "\<Esc>[5 q"
"   autocmd VimLeave * silent execute "!echo -en \<esc>[3 q"
endif

if exists('$TMUX')
   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]12;Green\x7\<Esc>\\"
   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]12;DarkCyan\x7\<Esc>\\"
   let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]12;Red\x7\<Esc>\\"
   let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[1 q\<Esc>\\"
   let &t_SR .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
   let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[5 q\<Esc>\\"
"   autocmd VimLeave * silent execute "!echo -en \<esc>[3 q"
endif

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
let g:NERDTreeWinPos = "right"

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
source ~/.vim/projects.vim

"Vimpager settings
let g:vimpager = {}
let g:less     = {}
let g:less.enabled = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

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

noremap j h
noremap k j
noremap l k
noremap ö l

nmap <silent> <C-w>l :wincmd k<CR>
nmap <silent> <C-w>k :wincmd j<CR>
nmap <silent> <C-w>j :wincmd h<CR>
nmap <silent> <C-w>ö :wincmd l<CR>

let mapleader="'"
"set pastetoggle=<F3>
map! <C-K> <Esc>
vnoremap <C-K> <Esc>
nmap <C-o> o<Esc>
map <S-k> gT
map <S-l> gt
map <C-k> :bprevious<CR>
map <C-l> :bnext<CR>
vmap <C-c> y
nmap <leader>/ :nohl<CR>
nnoremap <silent> <Leader>l :exe "resize +5"<CR>
nnoremap <silent> <Leader>k :exe "resize -5"<CR>
nnoremap <silent> <Leader>ö :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>j :exe "vertical resize -5"<CR>
nnoremap <leader>ev :tabnew ~/.vimrc<CR>
noremap <silent> <Leader>w :call ToggleWrap()<CR>
noremap <Leader>gg gg=G
cmap Q q
cmap W w
"cmap qw wq
nmap QQ :q<CR>
nmap WW :wq<CR>
map + $
map <leader>X :!chmod +x %<CR><CR>
map <leader>W :%s/ \{2,}/ /g<CR>
map <C-a> <Nop>
map <leader>c :set cursorline!<CR>:set cursorcolumn!<CR>
noremap <silent> <leader>n :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>
noremap <leader>p "0p

map <F5> :call CompileRunGcc()<CR>
vnoremap <F9> "ry:call Func2X11()<cr>

command! Sw silent execute 'write !sudo tee ' . shellescape(@%, 1) . ' >/dev/null'

" Mappings for plugins

nmap <F12> :TagbarToggle<CR>
map <F2> <plug>NERDTreeTabsToggle<CR>
nmap <F11> :RandomColorScheme<CR>
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
nmap <leader>s ys$"

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

" Fallback copy

function! Func2X11()
   :call system('xclip -selection c', @r)
endfunction
