"┃ ~/.vim/appearance.vim
"┣━━━━━━━━━━━━━━━━━━━━━━
"┃ mjturt

"----------------"
" Vim appearance "
"----------------"

set titlestring=%(\ %M%)%(\ %F%)%a\ -\ 

color sourcerer

set background=dark
hi Normal guibg=NONE ctermbg=NONE
hi Visual ctermbg=3 ctermfg=0
hi TabLine ctermbg=NONE ctermfg=101
hi TabLineFill ctermbg=NONE ctermfg=101
hi TabLineSel cterm=bold ctermbg=101 ctermfg=16
hi LineNr cterm=bold ctermbg=NONE ctermfg=237

" Cursor color and shape
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

"-------------"
" Status line "
"-------------"

set statusline=
set statusline+=%1*\ %{ModeCurrent()}%*%2*%*
set statusline+=\ %-3.(%3*%m%*%)\ %4*%f%*\ %y
set statusline+=\ %{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}
set statusline+=%h%r
set statusline+=%=
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*
set statusline+=%-16.(C:%c\ L:%4*%l%*/%L%)
set statusline+=%{noscrollbar#statusline(15,'▒','▉')}
set statusline+=\ %4*%n%*

" Mode indicator
let g:currentmode={ 'n' : 'N ', 'no' : 'N·O ', 'v' : 'V ', 'V' : 'V·L ', '^V' : 'V·B ', 's' : 'S ', 'S': 'S·L ', '^S' : 'S·B ', 'i' : 'I ', 'R' : 'R ', 'Rv' : 'V·R ', 'c' : 'C ', 'cv' : 'V-Ex ', 'ce' : 'Ex ', 'r' : 'P ', 'rm' : 'M ', 'r?' : 'Confirm ', '!' : 'S ', 't' : 'T '}
function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·B '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Statusline colors
hi StatusLine cterm=NONE ctermbg=NONE ctermfg=101
hi User1 cterm=bold ctermbg=101   ctermfg=16   guibg=green guifg=red
hi User2 cterm=bold ctermbg=NONE  ctermfg=101  guibg=red   guifg=blue
hi User3 cterm=bold ctermbg=NONE  ctermfg=64 guibg=blue  guifg=green
hi User4 cterm=bold ctermbg=NONE  ctermfg=101  guibg=red   guifg=blue
au InsertEnter * hi User1 ctermbg=16 ctermfg=101 | hi User2 ctermfg=16
au InsertLeave * hi User1 ctermbg=101 ctermfg=16 | hi User2 ctermfg=101
