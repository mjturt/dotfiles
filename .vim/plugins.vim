"┃ ~/.vim/plugins.vim
"┣━━━━━━━━━━━━━━━━━━━
"┃ mjturt

"------------------"
" Vim-Plug install "
"------------------"

if empty(glob('~/.vim/autoload/plug.vim'))
   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"---------"
" Plugins "
"---------"

call plug#begin('~/.vim/plugged')

" Completion
if os=="freebsd"
   Plug 'Valloric/YouCompleteMe'
else
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'artur-shaik/vim-javacomplete2'

" Syntax
Plug 'vim-syntastic/syntastic'
Plug 'vitalk/vim-shebang'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ricpelo/vim-gdscript'
Plug 'tmux-plugins/vim-tmux'

" Automation
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-surround'

" Interface
Plug 'easymotion/vim-easymotion'
Plug 'farmergreg/vim-lastplace'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-eunuch'
Plug 'google/vim-searchindex'
Plug 'lilydjwg/colorizer'
Plug 'francoiscabrol/ranger.vim'
Plug 'ap/vim-buftabline'
Plug 'ryanoasis/vim-devicons'
Plug 'gcavallanti/vim-noscrollbar'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Additional language support
Plug 'derekwyatt/vim-scala'
Plug 'ensime/ensime-vim'

" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'jacoborus/tender.vim'
Plug 'xero/sourcerer.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'

call plug#end()

"-----------------"
" Plugin settings "
"-----------------"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_remove_include_errors = 1

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 2
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1
