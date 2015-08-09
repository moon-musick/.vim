" general indentation settings
autocmd FileType perl set expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent

" perltidy function
" http://stackoverflow.com/questions/2345519/how-can-i-script-vim-to-run-perltidy-on-a-buffer
command -range=% -nargs=* Tidy <line1>,<line2>!perltidy

" define function saving cursor position
function PerlTidy()
  let l = line(".")
  let c = col(".")
  :Tidy
  call cursor(l, c)
  bufdo update
endfun

" run automatically on perl files
" autocmd FileType perl :autocmd BufWritePre <buffer> silent! call PerlTidy()
