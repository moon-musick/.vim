let g:grepper = {
  \ 'sift': {
  \   'grepprg':     'sift -n --binary-skip',
  \   'grepformat': '%f:%l:%m',
  \   'escape':     '\+*?^$%#()[]' }
  \ }

command! -nargs=* -complete=file Sift Grepper -tool sift -query <args>

nnoremap gs <Plug>(GrepperOperator)
xnoremap gs <Plug>(GrepperOperator)
