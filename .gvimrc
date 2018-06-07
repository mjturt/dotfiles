" ~/.gvimrc
" ---------
" mjturt

set background=dark
highlight iCursor guifg=white guibg=green
highlight Cursor guifg=orange guibg=DarkCyan
set guicursor+=i:ver25-iCursor
set mousefocus

" Keyboard mappings

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
