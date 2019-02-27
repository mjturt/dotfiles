function! myspacevim#after() abort
  set clipboard=unnamedplus
  set matchpairs+=<:>
  set backspace=indent,eol,start
  set whichwrap+=<,>,h,l
  set ignorecase
  set smartcase
  set smartindent
  set wrap
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
endfunction

function! myspacevim#before() abort
  let g:mapleader="'"
  noremap <Leader>gg gg=G
  noremap <leader>s :%s//g<LEFT><LEFT>
  map <C-o>     <Plug>(neosnippet_expand_or_jump)
  smap <C-o>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-o>     <Plug>(neosnippet_expand_target)
endfunction
