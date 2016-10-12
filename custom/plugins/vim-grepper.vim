let g:grepper = {
  \ 'sift': {
  \   'grepprg':     'sift -n --binary-skip',
  \   'grepformat': '%f:%l:%m',
  \   'escape':     '\+*?^$%#()[]' },
  \ 'rg': {
  \   'grepprg': 'rg -n -i --column --color=never --no-heading',
  \   'grepformat': '%f:%l:%c:%m',
  \   'escape':     '\+*?^$%#()[]' },
  \ 'tools': ['rg', 'sift'],
  \ }

command! -nargs=* -complete=file Sift Grepper -tool sift -query <args>
command! -nargs=* -complete=file Rg   Grepper -tool rg   -query <args>

nmap gs <Plug>(GrepperOperator)
xmap gs <Plug>(GrepperOperator)
