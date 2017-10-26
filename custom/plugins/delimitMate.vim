" enable space expansion (add space to both ends if entered after a delimiter)
let g:delimitMate_expand_space = 1

" enable newline expansion
let g:delimitMate_expand_cr = 1

" enable jump expansion
let g:delimitMate_jump_expansion = 1

augroup delimitmate_filetype
  autocmd!
  autocmd FileType haskell,go,sh,zsh let b:delimitMate_matchpairs = '(:),[:],{:}'
augroup END
