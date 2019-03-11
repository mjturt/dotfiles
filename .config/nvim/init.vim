"┃ ~/.config/nvim/init.vim
"┣━━━━━━━━━━━━━━━━━━━━━━━━
"┃ mjturt

" First figure out OS
" -------------------

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

" Vim-Plug install
" ----------------

if empty(glob('~/.config/nvim/plugins/plug.vim'))
   silent !curl -fLo ~/.config/nvim/plugins/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
" -------

call plug#begin('~/.config/nvim/plugins')

" -- Completion --
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" -- Snippets --
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" -- Syntax checking --
Plug 'neomake/neomake'

" -- Better/additional language support --
Plug 'sheerun/vim-polyglot'
Plug 'vitalk/vim-shebang'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ricpelo/vim-gdscript'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'StanAngeloff/php.vim'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

" -- Code formatting --
Plug 'sbdchd/neoformat'
Plug 'stephpy/vim-php-cs-fixer'

" -- Language Client --
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next',  'do': 'bash install.sh', }

" -- Additional features --
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'xolox/vim-misc'
Plug 'mbbill/undotree'
Plug 'dbakker/vim-projectroot'
Plug 'dbeniamine/vim-mail'
Plug 'wsdjeg/FlyGrep.vim'

" -- UI --
Plug 'farmergreg/vim-lastplace'
Plug 'google/vim-searchindex'
Plug 'lilydjwg/colorizer'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
"Plug 'gcavallanti/vim-noscrollbar'
Plug 'junegunn/goyo.vim'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'mhinz/vim-startify'
Plug 'kien/rainbow_parentheses.vim'
Plug 'moll/vim-bbye'

" -- Tags --
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" -- fzf --
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

" -- Files --
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'

" -- Airline --
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" -- Git --
Plug 'lambdalisue/gina.vim'
Plug 'airblade/vim-gitgutter'

" -- Colorschemes --
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'jacoborus/tender.vim'
"Plug 'xero/sourcerer.vim'
"Plug 'arcticicestudio/nord-vim'
"Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'

call plug#end()

" Plugin settings
" ---------------

" -- Deoplete --
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1

" -- Neomake --
call neomake#configure#automake('nrwi', 500)

" -- Airline --
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" -- Language server --
let g:LanguageClient_serverCommands = { 'java': ['/usr/bin/jdtls', '-data', getcwd()], }

" Settings
" --------

color gruvbox

set nocompatible
set encoding=utf-8
set ttyfast
set mouse=a
set clipboard=unnamedplus

" -- Syntax/filetype --
syntax on
filetype plugin indent on

" -- Interface --
set ruler
set number relativenumber
"set noshowmode
set hidden
set wildmenu
set showcmd
set report=0
set titlestring=%(\ %M%)%(\ %F%)%a\ -\ 
set title
set list listchars=tab:∙\ ,extends:,precedes:
set shortmess=atI
set laststatus=2

" -- Behavior --
set matchpairs+=<:>
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set autoread
set autochdir
set nojoinspaces
set nostartofline

" -- Completion --
"set complete=.,w,b,u,t
"set completeopt=longest,menuone

" -- Performance --
set ttimeout
set ttimeoutlen=200
"set lazyredraw

" -- Search --
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set icm=nosplit

" -- No folds --
set nofoldenable
set foldmethod=indent

" -- Indent / tab-key behavior --
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set smartindent

" -- Cursor position which triggers scrolling --
set sidescroll=40
set scrolloff=3

" -- Temporary files (and persistent undo) --
set backupdir=~/.vim/temp/backup
set directory=~/.vim/temp/swap
set undodir=~/.vim/temp/undo
set backup
set noswapfile
set undofile

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.
" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" -- Python path --
if os=="freebsd"
   let g:python3_host_prog="/usr/local/bin/python3.6"
elseif os=="linux"
   let g:python3_host_prog="/usr/bin/python3"
endif

" -- Transfer + -register content to system clipboard on exit --
"autocmd VimLeave * call system("xsel -ib", getreg('+'))

" Filetype settings
" -----------------

" -- Java completion --
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" -- Document viewing --
autocmd BufReadPost *.doc silent %!antiword "%"
autocmd BufWriteCmd *.doc set readonly
autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"
autocmd BufWriteCmd *.odt set readonly
autocmd BufReadPost *.pdf  silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78
autocmd BufWriteCmd *.pdf set readonly
autocmd BufReadPost *.rtf silent %!unrtf --text "%"
autocmd BufWriteCmd *.rtf set readonly

" -- Latex --
let g:tex_flavor = 'tex'

" Keyboard mappings
" -----------------

" -- Basics --
map <S-h> :bprevious<CR>
map <S-l> :bnext<CR>
map <C-a> <Nop>
nmap QQ :q<CR>
nmap QW :wq<CR>
vmap <C-c> y
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nnoremap <cr> o<esc>
map <Esc> :nohl<CR>
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

" -- Neosnippet
imap <C-o> <Plug>(neosnippet_expand_or_jump)
smap <C-o> <Plug>(neosnippet_expand_or_jump)
xmap <C-o> <Plug>(neosnippet_expand_target)

" -- Leader key --
let mapleader="\<Space>"
nnoremap <leader>ev :tabnew ~/.config/nvim/init.vim<CR>
noremap <leader>es :so ~/.config/nvim/init.vim<cr>
noremap <silent> <Leader>w :call ToggleWrap()<CR>
map <leader>X :!chmod +x %<CR><CR>
noremap <silent> <leader>n :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>
noremap <leader>p "bp
noremap <leader>R :let @b=@+<CR>
noremap <leader>f gqap
noremap <leader>s :%s//g<LEFT><LEFT>
noremap <Leader>gg gg=G

noremap <leader>gr :FlyGrep<cr>
noremap <leader>P :RainbowParenthesesToggle<cr>:RainbowParenthesesLoadBraces<cr>
noremap <leader>G :Goyo<CR><CR>
nnoremap <leader>u :UndotreeToggle<cr>
nmap <leader>F :!shfmt -i 3 -ci -sr -w %<CR><CR>
nnoremap <leader>r :NERDTreeToggle<cr>
nnoremap <leader>T :Tagbar<cr><cr>
nmap <leader><Tab> :FZF<cr>

" -- Leader guide
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

" -- Resizing panes --
nnoremap <silent> <Leader>h :exe "vertical resize -5"<CR>
nnoremap <silent> <Leader>j :exe "resize -5"<CR>
nnoremap <silent> <Leader>k :exe "resize +5"<CR>
nnoremap <silent> <Leader>l :exe "vertical resize +5"<CR>

" -- Function keys --
map <F5> :call CompileAndRun()<CR>
vnoremap <F9> "ry:call Func2X11()<cr>
"set pastetoggle=<F3>
" -- Javacomplete plugin
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)

" -- Command prompt --
cmap Q q
cmap W w

" Custom functions
" ----------------

" -- Compile and run --
func! CompileAndRun()
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
      exec "!$BROWSER % &"
   elseif &filetype == 'go'
      exec "!go build %<"
      exec "!time go run %"
   elseif &filetype == 'markdown'
      exec "!$BROWSER http://localhost:6419/ & grip %"
   elseif &filetype == 'tex'
      exec "!pdflatex -shell-escape % && biber %< && pdflatex -shell-escape %"
      exec "!zathura %<.pdf &"
   endif
endfunc

" -- ToggleWrap --
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

" -- Fallback copy to clipboard --
function! Func2X11()
   :call system('xclip -selection c', @r)
endfunction

" Commands
" --------

" -- New script --
command! -nargs=1 ShebangFile :new <args> | 0put =\"#!/usr/bin/env bash\<nl>\"|$
command! Shebang 0put =\"#!/usr/bin/env bash\<nl>\"|$

" -- New dotfile --
command! -nargs=1 NewdotFile :new <args> | 0put =\"#┃ ~/\<nl>#┣━━━━━━━━━\<nl>#┃ mjturt\"|normal gg$
command! Newdot 0put =\"#┃ ~/\<nl>#┣━━━━━━━━━\<nl>#┃ mjturt\"|normal gg$

" Personal project settings
" -------------------------

source $HOME/.config/nvim/projects.vim

" Tips
" ----

" Delete all blank or whitespace lines
" g/^\s*$/d
" Delete all spaces and tabs at the end of lines
" %s/\s\+$//
" Delete whitespaces longer than 2 characters
" :%s/ \{2,}/ /g
