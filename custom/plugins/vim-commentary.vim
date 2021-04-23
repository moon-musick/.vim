" fix comment characters for specific filetypes (Tim Pope's vim-commentary)
augroup commentstring
  autocmd!
  autocmd FileType puppet set commentstring=#\ %s
  autocmd FileType conf   set commentstring=#\ %s
  autocmd FileType cfg    set commentstring=#\ %s
  autocmd FileType nagios set commentstring=#\ %s
  autocmd FileType i3     set commentstring=#\ %s
  autocmd FileType lilypond set commentstring=%\ %s
  autocmd FileType v      set commentstring=//\ %s
augroup END
