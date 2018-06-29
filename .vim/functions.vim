"┃ ~/.vim/functions.vim
"┣━━━━━━━━━━━━━━━━━━━━━
"┃ mjturt

"---------------"
" Vim functions "
"---------------"

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

"----------"
" Commands "
"----------"

command! Sw silent execute 'write !sudo tee ' . shellescape(@%, 1) . ' >/dev/null'
command! -nargs=1 Shebang :new <args> | 0put =\"#!/bin/bash\<nl>\"|$
command! -nargs=1 Newdot :new <args> | 0put =\"#┃\<nl>#┣━━━━━━━━━\<nl>#┃ mjturt\"|$
