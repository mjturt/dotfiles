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

"if empty(glob('~/.config/nvim/plugins/plug.vim'))
"   silent !curl -fLo ~/.config/nvim/plugins/plug.vim --create-dirs
"            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

" Plugins
" -------

call plug#begin('~/.cache/nvim/plugins')

" -- Snippets --
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" -- Lint / LanguageClient / Completion --
if os=="linux"
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-phpls', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-sh', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-stylelint', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-texlab', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-sh', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neoclide/coc-diagnostic', {'do': 'yarn install --frozen-lockfile'}
endif

" -- Better/additional language support --
Plug 'sheerun/vim-polyglot'
Plug 'moll/vim-node'
Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim'
Plug 'dbeniamine/vim-mail'
Plug 'lervag/vimtex'
Plug 'fatih/vim-go'

" -- Additional features --
Plug 'scrooloose/nerdcommenter'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc'
Plug 'mbbill/undotree'
Plug 'dbakker/vim-projectroot'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" -- UI --
Plug 'farmergreg/vim-lastplace'
Plug 'google/vim-searchindex'
Plug 'lilydjwg/colorizer'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'
Plug 'hecal3/vim-leader-guide'

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
Plug 'zivyangll/git-blame.vim'

" -- Colors --
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" Plugin settings
" ---------------

" -- COC --
autocmd CursorHold * silent call CocActionAsync('highlight')

" -- Airline --
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme='dracula'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''


" -- Vim-markdown --
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" -- Colorizer --
let g:colorizer_maxlines = 1000

" -- CtrlP --
set wildignore+=vendor/*,docs/*,node_modules/*,components/*,build/*,dist/*,tags
let g:ctrlp_map = '<leader><Tab>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|.venv\'

" -- Gutentags --
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ },
      \ }
let g:gutentags_generate_on_new = 1

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
    \ 'js' : 1
    \}

" -- Closetag --
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.vue,*.php,*.jinja,*.js'

" -- NerdCommenter --
let g:NERDSpaceDelims = 1

" -- NeoSnippet --
let g:neosnippet#enable_snipmate_compatibility = 1

" -- lf --
let g:lf_map_keys = 0

" -- Bclose --
let g:bclose_no_plugin_maps = 1

" -- Vimtex --
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" -- Edge --
let g:edge_style = 'neon'
let g:edge_transparent_background = 1

" -- Dracula --
let g:dracula_colorterm = 0

" Settings
" --------

colorscheme dracula

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
set shortmess+=c
set updatetime=300
set cmdheight=2

" -- Behavior --
set matchpairs+=<:>
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set autochdir
set complete=k**/*

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
set backupdir=~/.cache/nvim/temp/backup
set directory=~/.cache/nvim/temp/swap
set undodir=~/.cache/nvim/temp/undo
set nobackup
set nowritebackup
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
autocmd FileType vue syntax sync fromstart
autocmd BufEnter *.vue :setlocal filetype=javascript
autocmd BufEnter *.vue :setlocal syntax=javascript

" -- Mail --
au BufRead /tmp/neomutt-* set tw=0

" Keyboard mappings
" -----------------

" -- Basics --
map <S-h> :bprevious<CR>
map <S-l> :bnext<CR>
nnoremap <c-cr> o<esc>

" -- COC --
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

imap <C-o> <Plug>(coc-snippets-expand)
nmap <silent> <c-l> <Plug>(coc-diagnostic-next)
nnoremap <silent> <c-K> :call <SID>show_documentation()<CR>

" -- Leader key --
let mapleader="\<Space>"
let maplocalleader = "-"

" -- Leader-guide
let g:lmap =  {}
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

" -- Config (e)
let g:lmap.e = { 'name' : 'Vim config file' }
nnoremap <leader>ev :tabnew ~/.config/nvim/init.vim<CR>
noremap <leader>es :so ~/.config/nvim/init.vim<cr>
" -- Buffers (r)
let g:lmap.r = { 'name' : 'Buffers / Files' }
map <leader>re :Lf<cr>
map <leader>rf :F<CR>
noremap <leader>rb :CtrlPBuffer<cr>
" -- Toggle vim settings (t)
let g:lmap.t = { 'name' : 'Toggle vim settings' }
noremap <silent> <Leader>tw :call ToggleWrap()<CR>
noremap <silent> <leader>tn :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>
noremap <leader>ts :set spell!<cr>
noremap <leader>tg :<C-u>call gitblame#echo()<CR>
" -- Formatting / Fixing (f)
let g:lmap.f = { 'name' : 'Formatting / Fixing' }
noremap <leader>fq gqap
noremap <Leader>fg gg=G
noremap <leader>ft :%s/\s\+$//<cr>
noremap <leader>fl :call CocAction('format')<cr>
noremap <leader>fp :CocCommand prettier.formatFile<cr>
nmap <leader>ff <Plug>(coc-fix-current)
nmap <leader>fo :call CocAction('runCommand', 'editor.action.organizeImport')<cr>
" -- Shortcut commands (s)
let g:lmap.s = { 'name' : 'Shortcuts' }
noremap <leader>ss :%s//g<LEFT><LEFT>
map <leader>sx :!chmod +x %<CR><CR>
noremap <leader>sp "bp
map <leader>q :nohl<CR>
map <leader>w :w<CR>
" -- Set filetype (F)
let g:lmap.F = { 'name' : 'Set filetype' }
noremap <leader>FH :set filetype=html<cr>
noremap <leader>FP :set filetype=php<cr>
noremap <leader>FJ :set filetype=javascript<cr>
noremap <leader>FV :set filetype=vue<cr>
" -- Plugin modes (m)
let g:lmap.m = { 'name' : 'Plugin modes' }
noremap <leader>mg :Goyo<CR><CR>
nnoremap <leader>mu :UndotreeToggle<cr>
nmap <leader><Tab> :FZF<cr>
" -- Compile and run (R)
map <leader>R :call CompileAndRun()<CR>
" Go to definitions (g)
let g:lmap.d = { 'name' : 'Go to definitions' }
noremap <leader>dd <c-]>
noremap <leader>da <Plug>(coc-definition)
noremap <leader>dt :CtrlPTag<cr>
" -- Generate strings (g)
let g:lmap.g = { 'name' : 'Generate strings',
            \ 'p' : ['read !pwgen 10', 'Password'],
            \ 'l' : ['read !echo "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."', 'Lorem ipsum'],
            \ 'd' : ['Newdot', 'Dotfile header'],
            \ 's' : ['Shebang', 'Shebang line'],
            \}
nmap <leader>gp :read !pwgen 10<CR>
nmap <leader>gl :read !echo 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'<CR>
nmap <leader>gd :Newdot<CR>
nmap <leader>gs :Shebang<CR>
" -- Panes (p)
let g:lmap.p = { 'name' : 'Panes' }
nnoremap <silent> <Leader>ph :exe "vertical resize -5"<CR>
nnoremap <silent> <Leader>pj :exe "resize -5"<CR>
nnoremap <silent> <Leader>pk :exe "resize +5"<CR>
nnoremap <silent> <Leader>pl :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>pp <c-w><c-w>
" -- Gitgutter (h)
let g:lmap.h = { 'name' : 'Gitgutter' }
" -- NerdCommenter (c)
let g:lmap.c = { 'name' : 'NerdCommenter' }

" -- Command prompt --
" cmap Q q
" cmap W w

" Custom functions
" ----------------

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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

" Tips
" ----

" Delete all blank or whitespace lines
" g/^\s*$/d
" Delete all spaces and tabs at the end of lines
" %s/\s\+$//
" Delete whitespaces longer than 2 characters
" :%s/ \{2,}/ /g
