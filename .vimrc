"┃ ~/.vimrc
"┣━━━━━━━━━
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

if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
" -------

call plug#begin('~/.vim/plugged')

" -- Completion --
if has('nvim')
   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
   Plug 'Shougo/deoplete.nvim'
   Plug 'roxma/nvim-yarp'
   Plug 'roxma/vim-hug-neovim-rpc'
endif
   let g:deoplete#enable_at_startup = 1
   "let g:deoplete#omni_patterns = {}
   "let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
   "let g:deoplete#auto_completion_start_length = 2
   "let g:deoplete#sources = {}
   "let g:deoplete#sources._ = []
   "let g:deoplete#file#enable_buffer_path = 1
"Plug 'Valloric/YouCompleteMe'
Plug 'artur-shaik/vim-javacomplete2'

" -- Snippets --
Plug 'SirVer/ultisnips'
   let g:UltiSnipsExpandTrigger="<c-o>"
   let g:UltiSnipsJumpForwardTrigger="<c-b>"
   let g:UltiSnipsJumpBackwardTrigger="<c-z>"
   let g:UltiSnipsEditSplit="vertical"
Plug 'honza/vim-snippets'

" -- Syntax checking --
"Plug 'vim-syntastic/syntastic'
   "let g:syntastic_always_populate_loc_list = 1
   "let g:syntastic_auto_loc_list = 1
   "let g:syntastic_check_on_open = 1
   "let g:syntastic_check_on_wq = 0
   "let g:syntastic_c_remove_include_errors = 1
   "let g:syntastic_go_checkers = ['go']

" -- Additional language support --
Plug 'vitalk/vim-shebang'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ricpelo/vim-gdscript'
Plug 'tmux-plugins/vim-tmux'
Plug 'derekwyatt/vim-scala'

Plug 'Yggdroot/indentLine'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
autocmd! BufWritePost,BufEnter * Neomake
augroup astyle
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" -- Automation --
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-surround'

" -- Interface --
Plug 'easymotion/vim-easymotion'
   let g:EasyMotion_do_mapping = 0
   let g:EasyMotion_smartcase = 1
Plug 'terryma/vim-multiple-cursors'
"Plug 'mjturt/ranger.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-eunuch'
Plug 'google/vim-searchindex'
Plug 'lilydjwg/colorizer'
Plug 'ap/vim-buftabline'
Plug 'ryanoasis/vim-devicons'
Plug 'gcavallanti/vim-noscrollbar'
Plug 'airblade/vim-rooter'
   let g:rooter_manual_only = 1
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" -- Git --
Plug 'tpope/vim-fugitive'
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

" Settings
" --------

set nocompatible
set encoding=utf-8
set ttyfast
set mouse=a
set clipboard=unnamedplus

" -- Syntax/filetype
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
"set nowrap
set laststatus=2

" -- Behavior --
set matchpairs+=<:>
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set autoread
set autochdir

" -- Completion --
set complete=.,w,b,u,t
set completeopt=longest,menuone

" -- Performance --
set notimeout
set ttimeout
set ttimeoutlen=10
set lazyredraw

" -- Search --
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

" -- No folds --
set nofoldenable
set foldmethod=indent

" -- Indent / tab-key behavior --
set expandtab
set shiftwidth=3
set softtabstop=3
set smarttab
"set tabstop=3
set autoindent
"set copyindent
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

" -- Python path --
if os=="freebsd"
   let g:python3_host_prog="/usr/local/bin/python3.6"
elseif os=="linux"
   let g:python3_host_prog="/usr/bin/python3"
endif

" -- Auto-source .vimrc when writing --
autocmd! bufwritepost .vimrc source ~/.vimrc

" -- Transfer + -register content to system clipboard on exit --
"autocmd VimLeave * call system("xsel -ib", getreg('+'))

" -- Defeault completion method --
set omnifunc=syntaxcomplete#Complete

" -- Gvim font --
if has("gui_running")
   if has("gui_gtk2") || has("gui_gtk3")
      set guifont=ShureTechMono\ Nerd\ Font\ Mono\ 10
   endif
endif

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

" Appearance
" ----------

" -- Color scheme --
color gruvbox

" -- Color overriding --
set background=dark
hi Normal guibg=NONE ctermbg=NONE
"hi Visual ctermbg=3 ctermfg=0
"hi TabLine ctermbg=NONE ctermfg=101
"hi TabLineFill ctermbg=NONE ctermfg=101
"hi TabLineSel cterm=bold ctermbg=101 ctermfg=16
"hi LineNr cterm=bold ctermbg=NONE ctermfg=237

" -- Cursor color and shape for urxvt+tmux --
" Normal: blue block
" Insert: green vertical line
" Replace: red underline
if exists('$TMUX')
   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]12;Green\x7\<Esc>\\"
   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]12;White\x7\<Esc>\\"
   let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]12;Red\x7\<Esc>\\"
   let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[1 q\<Esc>\\"
   let &t_SR .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
   let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[5 q\<Esc>\\"
   autocmd VimLeave * silent execute '!print -n -- "\033Ptmux;\033\033[2 q\033\\"'
   "autocmd VimLeave * silent execute '!print -n -- "\033Ptmux;\033\033]12;burlywood4\x7\033\\"'
   autocmd VimLeave * silent execute '!print -n -- \033Ptmux;\033\033]12;White\x7\033\\"'
endif

" Status line
" -----------

" -- Statusline sections --
set statusline=
set statusline+=%1*\ %{ModeCurrent()}%*%2*%*
set statusline+=\ %-3.(%3*%m%*%)\ %4*%f%*\ %y
set statusline+=\ %{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}
set statusline+=%h%r
set statusline+=%=
"set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*
set statusline+=%-16.(C:%c\ L:%4*%l%*/%L%)
set statusline+=%{noscrollbar#statusline(15,'▒','▉')}
set statusline+=\ %4*%n%*

" -- Statusline mode indicator --
let g:currentmode={ 'n' : 'N ', 'no' : 'N·O ', 'v' : 'V ', 'V' : 'V·L ', '^V' : 'V·B ', 's' : 'S ', 'S': 'S·L ', '^S' : 'S·B ', 'i' : 'I ', 'R' : 'R ', 'Rv' : 'V·R ', 'c' : 'C ', 'cv' : 'V-Ex ', 'ce' : 'Ex ', 'r' : 'P ', 'rm' : 'M ', 'r?' : 'Confirm ', '!' : 'S ', 't' : 'T '}
function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·B '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" -- Statusline colors --
hi StatusLine cterm=NONE ctermbg=NONE ctermfg=101
hi StatusLineNC cterm=NONE ctermbg=016 ctermfg=101
hi User1 cterm=bold ctermbg=101   ctermfg=16   guibg=green guifg=red
hi User2 cterm=bold ctermbg=NONE  ctermfg=101  guibg=red   guifg=blue
hi User3 cterm=bold ctermbg=NONE  ctermfg=64 guibg=blue  guifg=green
hi User4 cterm=bold ctermbg=NONE  ctermfg=101  guibg=red   guifg=blue
au InsertEnter * hi User1 ctermbg=16 ctermfg=101 | hi User2 ctermfg=16
au InsertLeave * hi User1 ctermbg=101 ctermfg=16 | hi User2 ctermfg=101

" Keyboard mappings
" -----------------

" -- HJKL -> JKLÖ --
noremap j h
noremap k gj
noremap l gk
noremap ö l

nmap <silent> <C-w>l :wincmd k<CR>
nmap <silent> <C-w>k :wincmd j<CR>
nmap <silent> <C-w>j :wincmd h<CR>
nmap <silent> <C-w>ö :wincmd l<CR>

" -- Basics --
map <S-k> :bprevious<CR>
map <S-l> :bnext<CR>
map + $
map <C-a> <Nop>
nmap QQ :q<CR>
nmap QW :wq<CR>
vmap <C-c> y
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nnoremap <cr> o<esc>
" -- Easymotion plugin
nmap s <Plug>(easymotion-overwin-f2)

" -- Leader key --
let mapleader="'"
nnoremap <leader>ev :tabnew ~/.vimrc<CR>
noremap <silent> <Leader>w :call ToggleWrap()<CR>
noremap <Leader>gg gg=G
nmap <leader>/ :nohl<CR>
map <leader>X :!chmod +x %<CR><CR>
map <leader>C :set cursorline!<CR>:set cursorcolumn!<CR>
noremap <silent> <leader>n :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>
nmap <leader>S :SyntasticToggleMode<CR>
nmap <leader>F :!shfmt -i 3 -ci -sr -w %<CR><CR>
nmap <leader>R :Rooter<CR>
noremap <leader>p "bp
noremap <leader>t :let @b=@+<CR>
noremap <leader>f gqap
noremap <leader>s :%s//g<LEFT><LEFT>
noremap <leader>G :Goyo<CR><CR>

" -- Ranger
map <leader>rr :Ranger<CR>
map <leader>rh :RangerCurrentFileNewVSplit<CR>
map <leader>rv :RangerCurrentFileNewSplit<CR>

" -- Resizing panes --
nnoremap <silent> <Leader>l :exe "resize +5"<CR>
nnoremap <silent> <Leader>k :exe "resize -5"<CR>
nnoremap <silent> <Leader>ö :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>j :exe "vertical resize -5"<CR>

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

source $HOME/.vim/projects.vim

" Tips
" ----

" Delete all blank or whitespace lines
" g/^\s*$/d
" Delete all spaces and tabs at the end of lines
" %s/\s\+$//
" Delete whitespaces longer than 2 characters
" :%s/ \{2,}/ /g
