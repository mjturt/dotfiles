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
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" -- Snippets --
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" -- Syntax checking --
Plug 'w0rp/ale'

" -- Better/additional language support --
Plug 'sheerun/vim-polyglot'
" Plug 'vitalk/vim-shebang'
" Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'ricpelo/vim-gdscript'
" Plug 'artur-shaik/vim-javacomplete2'
" Plug 'StanAngeloff/php.vim'
" Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
" Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
"Plug 'dsawardekar/wordpress.vim'
" Plug 'shawncplus/phpcomplete.vim'
" Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'moll/vim-node'
Plug 'epilande/vim-react-snippets'
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'
Plug 'udalov/kotlin-vim'
" Plug 'posva/vim-vue'

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
" Plug 'Shougo/context_filetype.vim'

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
" Plug 'terryma/vim-smooth-scroll'

" -- Tags --
" Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" -- Fuzzy finging --
Plug 'ctrlpvim/ctrlp.vim'
"Plug '/usr/bin/fzf'
"Plug 'junegunn/fzf.vim'
"Plug 'https://gist.github.com/drasill/ff9b94025dc8aa7e404f',
    "\ { 'dir': g:plug_home.'/vim-fzf-git-ls-files/plugin', 'rtp': '..' }

" -- Files --
" Plug 'scrooloose/nerdtree'
Plug 'mjturt/ranger.vim'
Plug 'dylanaraps/fff.vim'
Plug 'rbgrouleff/bclose.vim'
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

" -- ALE --
let b:ale_linters = {
            \'css': ['prettier'],
            \}
let g:ale_fixers = {
            \'javascript': ['prettier'],
            \'css': ['prettier'],
            \'python': ['autopep8'],
            \}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" -- Deoplete --
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1

" -- Neomake --
" call neomake#configure#automake('nrwi', 500)

" -- Airline --
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" -- Language server --
let g:LanguageClient_serverCommands = { 'java': ['/usr/bin/jdtls', '-data', getcwd()],
            \ 'sh': ['bash-language-server', 'start'],
            \ 'python': ['pyls'],
            \ 'html': ['html-languageserver', '--stdio'],
            \ }
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = "~/.vim/settings.json"
let g:LanguageClient_diagnosticsDisplay = {
            \ 1: {
            \     "name": "Error",
            \     "texthl": "ALEError",
            \     "signText": "",
            \     "signTexthl": "ALEErrorSign",
            \ },
            \ 2: {
            \     "name": "Warning",
            \     "texthl": "ALEWarning",
            \     "signText": "",
            \     "signTexthl": "ALEWarningSign",
            \ },
            \ 3: {
            \     "name": "Information",
            \     "texthl": "ALEInfo",
            \     "signText": "",
            \     "signTexthl": "ALEInfoSign",
            \ },
            \ 4: {
            \     "name": "Hint",
            \     "texthl": "ALEInfo",
            \     "signText": "",
            \     "signTexthl": "ALEInfoSign",
            \ },
            \}

" -- Vim-markdown --
let g:vim_markdown_conceal = 0

" -- Colorizer --
let g:colorizer_maxlines = 1000

" -- Wordpress --
let g:wordpress_vim_wordpress_path = "/usr/share/webapps/wordpress"

" -- CtrlP --
set wildignore+=vendor/*,docs/*,node_modules/*,components/*,build/*,dist/*,tags
let g:ctrlp_map = '<leader><Tab>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" -- MatchTagAlways --
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \ 'jsx' : 1,
    \}

" -- Neoformat --
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_java_uncrustify = {
            \ 'exe': 'uncrustify',
            \ 'args': ['-c ~/.uncrustify', '--no-backup', '-f'],
            \ }
let g:neoformat_enabled_java = ['uncrustify']
let g:neoformat_php_phpcsfixer = {
            \ 'exe': 'php-cs-fixer',
            \ 'args': ['fix', '--rules=@Symfony,@PhpCsFixer,-@PSR1,-blank_line_before_statement,indentation_type'],
            \ 'stdin': 0,
            \ 'replace': 1,
            \ }
let g:neoformat_enabled_php = ['phpcsfixer']

" -- NerdCommenter --
let g:NERDSpaceDelims = 1

" -- NeoSnippet --
let g:neosnippet#enable_snipmate_compatibility = 1

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
autocmd FileType mail  highlight ExtraWhitespace ctermbg=NONE guibg=NONE

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

" -- Vue --
" autocmd FileType vue syntax sync fromstart
autocmd BufEnter *.vue :setlocal filetype=vue
autocmd BufEnter *.vue :setlocal syntax=javascript

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

" -- Smooth scroll
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" -- Leader key --
let mapleader="\<Space>"
nnoremap <leader>ev :tabnew ~/.config/nvim/init.vim<CR>
noremap <leader>so :so ~/.config/nvim/init.vim<cr>
noremap <silent> <Leader>w :call ToggleWrap()<CR>
map <leader>X :!chmod +x %<CR><CR>
noremap <silent> <leader>n :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>
noremap <leader>p "bp
noremap <leader>R :let @b=@+<CR>
noremap <leader>f gqap
noremap <leader>ss :%s//g<LEFT><LEFT>
noremap <Leader>gg gg=G
noremap <leader>sw :%s/\s\+$//<cr>
noremap <leader>S :set spell!<cr>
noremap <leader>FH :set filetype=html<cr>
noremap <leader>FP :set filetype=php<cr>
noremap <leader>jj <c-]>

noremap <leader>gr :FlyGrep<cr>
noremap <leader>P :RainbowParenthesesToggle<cr>:RainbowParenthesesLoadBraces<cr>
noremap <leader>G :Goyo<CR><CR>
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <leader>rr :NERDTreeToggle<cr>
map <leader>re :Ranger<CR>
map <leader>rv :RangerCurrentFileNewVSplit<CR>
map <leader>rs :RangerCurrentFileNewSplit<CR><Paste>
map <leader>rf :F<CR>
nnoremap <leader>T :Tagbar<cr><cr>
nmap <leader><Tab> :FZF<cr>
nmap <leader>J <Plug>(JavaComplete-Imports-AddMissing)
map <leader>R :call CompileAndRun()<CR>
vnoremap <leader>Y "ry:call Func2X11()<cr>
map <leader>C :ColorToggle<CR>
nmap <leader>LS :!shfmt -i 4 -ci -sr -w %<CR><CR>
nmap <leader>LE :!eslint --fix %<CR><CR>
nmap <leader>LL :Neoformat<CR>
nmap <leader>PW :read !pwgen 10<CR>
nnoremap <leader>LC :call LanguageClient_contextMenu()<CR>
noremap <leader>bb :CtrlPBuffer<cr>

" -- Leader guide
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

" -- Resizing panes --
nnoremap <silent> <Leader>h :exe "vertical resize -5"<CR>
nnoremap <silent> <Leader>j :exe "resize -5"<CR>
nnoremap <silent> <Leader>k :exe "resize +5"<CR>
nnoremap <silent> <Leader>l :exe "vertical resize +5"<CR>

" -- Command prompt --
" cmap Q q
" cmap W w

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
