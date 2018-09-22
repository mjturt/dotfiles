"┃ ~/.vim/keybindings.vim
"┣━━━━━━━━━━━━━━━━━━━━━━━
"┃ mjturt

"-----------------------"
" Vim keyboard mappings "
"-----------------------"

noremap j h
noremap k j
noremap l k
noremap ö l

nmap <silent> <C-w>l :wincmd k<CR>
nmap <silent> <C-w>k :wincmd j<CR>
nmap <silent> <C-w>j :wincmd h<CR>
nmap <silent> <C-w>ö :wincmd l<CR>

nmap <C-o> o<Esc>
"set pastetoggle=<F3>
map <S-k> :bprevious<CR>
map <S-l> :bnext<CR>
map + $
map <C-a> <Nop>
nmap QQ :q<CR>
nmap WW :wq<CR>
vmap <C-c> y

let mapleader="'"
nnoremap <silent> <Leader>l :exe "resize +5"<CR>
nnoremap <silent> <Leader>k :exe "resize -5"<CR>
nnoremap <silent> <Leader>ö :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>j :exe "vertical resize -5"<CR>

nnoremap <leader>ev :tabnew ~/.vimrc<CR>
noremap <silent> <Leader>w :call ToggleWrap()<CR>
noremap <Leader>gg gg=G
nmap <leader>/ :nohl<CR>
map <leader>X :!chmod +x %<CR><CR>
map <leader>W :%s/ \{2,}/ /g<CR>
map <leader>c :set cursorline!<CR>:set cursorcolumn!<CR>
noremap <silent> <leader>n :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>
noremap <leader>p "0p
noremap <leader>d di"

map <F5> :call CompileRunGcc()<CR>
vnoremap <F9> "ry:call Func2X11()<cr>

cmap Q q
cmap W w

" Mappings for plugins
nmap s <Plug>(easymotion-overwin-f2)
nmap <leader>s ys$"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
