"┃ ~/.config/nvim/init.vim
"┣━━━━━━━━━━━━━━━━━━━━━━━━
"┃ mjturt

" First figure out OS and user
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

let user = substitute(system("whoami"), '\n\+$', '', '')

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

" -- Snippets --
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" -- Lint / LanguageClient / Completion --
if os=="linux"
    Plug 'w0rp/ale', { 'do': 'npm install -g tern css-lint' }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" -- Better/additional language support --
Plug 'sheerun/vim-polyglot'
Plug 'moll/vim-node'
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'
Plug 'lervag/vimtex'
Plug 'editorconfig/editorconfig-vim'
Plug 'dbeniamine/vim-mail'


" -- Additional features --
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'mbbill/undotree'
Plug 'dbakker/vim-projectroot'

" -- UI --
Plug 'farmergreg/vim-lastplace'
Plug 'google/vim-searchindex'
Plug 'lilydjwg/colorizer'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" -- Tags --
Plug 'ludovicchabant/vim-gutentags'

" -- Fuzzy finging --
Plug 'ctrlpvim/ctrlp.vim'

" -- Files --
Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'

" -- Airline --
Plug 'vim-airline/vim-airline'
Plug 'mjturt/vim-airline-themes'

" -- Git --
Plug 'airblade/vim-gitgutter'

call plug#end()

" Plugin settings
" ---------------

" -- ALE --
let b:ale_linters = {
            \'css': ['prettier', 'stylelint'],
            \'python': ['flake8', 'pylint', 'mypy'],
            \}
let g:ale_fixers = {
            \'*': ['remove_trailing_lines', 'trim_whitespace'],
            \'javascript': ['prettier', 'eslint'],
            \'css': ['prettier'],
            \'python': ['isort',  'autopep8'],
            \'php': ['php_cs_fixer'],
            \'sh': ['shfmt'],
            \}
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
" -- Python
let g:ale_python_autopep8_options = '-aaaaaa'
let g:ale_python_pylint_options = '--load-plugins pylint_django --max-line-length=120'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_flake8_options = '--ignore=F401'
let g:ale_python_auto_pipenv = 1
let g:ale_python_pylint_auto_pipenv = 1
" -- PHP
let g:ale_php_cs_fixer_options  = '--rules=@Symfony,@PhpCsFixer,-@PSR1,-blank_line_before_statement,indentation_type'
" -- SH
let g:ale_sh_shfmt_options = '-i 4 -ci -sr'

" -- Deoplete --
let g:deoplete#enable_at_startup = 1

" -- Airline --
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='cyberpunk'

" -- Vim-markdown --
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" -- Colorizer --
let g:colorizer_maxlines = 1000

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
    \ 'javascript' : 1,
    \ 'jsx' : 1,
    \ 'vue' : 1,
    \ 'php' : 1,
    \}

" -- Closetag --
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.vue,*.php'

" -- NerdCommenter --
let g:NERDSpaceDelims = 1

" -- NeoSnippet --
let g:neosnippet#enable_snipmate_compatibility = 1

" -- lf --
let g:lf_map_keys = 0

" -- polyglot --
let g:polyglot_disabled = ['latex']

" Settings
" --------

color cyberpunkneon_mjturt

set nocompatible
set encoding=utf-8
set ttyfast
set mouse=a
set clipboard=unnamedplus
if os == "freebsd"
    if user == "root"
        set clipboard=
    endif
endif

" -- Syntax/filetype --
syntax on
filetype plugin indent on

" -- Interface --
set ruler
set number relativenumber
set noshowmode
set hidden
set showcmd
set report=0
set titlestring=%(\ %M%)%(\ %F%)%a\ -\ 
set title
set list listchars=tab:∙\ ,extends:,precedes:
set laststatus=2

" -- Behavior --
set matchpairs+=<:>
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set autochdir

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

" Tell Vim which characters to show for expanded TABs
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
highlight Tabs ctermfg=darkgreen
match Tabs /\t/
autocmd FileType mail  highlight ExtraWhitespace ctermbg=NONE guibg=NONE

" -- Python path --
if os=="freebsd"
   let g:python3_host_prog="/usr/local/bin/python3.6"
elseif os=="linux"
   let g:python3_host_prog="/usr/bin/python3"
endif

" -- Transfer + -register content to system clipboard on exit --
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" Filetype settings
" -----------------

" -- Latex --
let g:tex_flavor = 'tex'

" -- Vue --
" autocmd FileType vue syntax sync fromstart
autocmd BufEnter *.vue :setlocal filetype=javascript
autocmd BufEnter *.vue :setlocal syntax=javascript

" -- Mail --
au BufRead /tmp/neomutt-* set tw=0

" Keyboard mappings
" -----------------

" -- Basics --
map <S-h> :bprevious<CR>
map <S-l> :bnext<CR>
nnoremap <cr> o<esc>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" -- Neosnippet
imap <C-o> <Plug>(neosnippet_expand_or_jump)
smap <C-o> <Plug>(neosnippet_expand_or_jump)
xmap <C-o> <Plug>(neosnippet_expand_target)

" -- Leader key --
"
let mapleader="\<Space>"
" -- Config (e)
nnoremap <leader>ev :tabnew ~/.config/nvim/init.vim<CR>
noremap <leader>es :so ~/.config/nvim/init.vim<cr>
" -- Buffers (r)
map <leader>re :Lf<cr>
map <leader>rf :F<CR>
noremap <leader>rb :CtrlPBuffer<cr>
" -- Toggle vim settings (t)
noremap <silent> <Leader>tw :call ToggleWrap()<CR>
noremap <silent> <leader>tn :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>
noremap <leader>ts :set spell!<cr>
" map <leader>tc :ColorToggle<CR>
" -- Formatting / Fixing (f)
noremap <leader>fq gqap
noremap <Leader>fg gg=G
noremap <leader>ft :%s/\s\+$//<cr>
noremap <leader>fl :ALEFix<cr>
" -- Shortcut commands (s)
noremap <leader>ss :%s//g<LEFT><LEFT>
map <leader>sx :!chmod +x %<CR><CR>
noremap <leader>sp "bp
map <leader>q :nohl<CR>
" -- Set filetype (F)
noremap <leader>FH :set filetype=html<cr>
noremap <leader>FP :set filetype=php<cr>
" -- Plugin modes (m)
noremap <leader>mg :Goyo<CR><CR>
nnoremap <leader>mu :UndotreeToggle<cr>
nmap <leader><Tab> :FZF<cr>
" -- Compile and run (R)
map <leader>R :call CompileAndRun()<CR>
" Go to definitions (g)
noremap <leader>dd <c-]>
noremap <leader>da :ALEGoToDefinition<CR>
noremap <leader>dr :ALEFindReferences<CR>
noremap <leader>dh :ALEHover<CR>
noremap <leader>de <Plug>(ale_next_wrap)
" -- Generate strings (g)
nmap <leader>gp :read !pwgen 10<CR>
nmap <leader>gl :read !echo 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'<CR>
nmap <leader>gd :Newdot<CR>
nmap <leader>gs :Shebang<CR>
" -- Panes (p) --
nnoremap <silent> <Leader>ph :exe "vertical resize -5"<CR>
nnoremap <silent> <Leader>pj :exe "resize -5"<CR>
nnoremap <silent> <Leader>pk :exe "resize +5"<CR>
nnoremap <silent> <Leader>pl :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>pp <c-w><c-w>
" -- Leader guide
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

" -- Command prompt --
cmap Q q

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
      " exec "!zathura %<.pdf &"
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

" Commands
" --------

" -- New files --
command! Shebang 0put =\"#!/usr/bin/env bash\<nl>\"|$
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
