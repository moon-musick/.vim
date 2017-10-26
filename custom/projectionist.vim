" let g:projectionist_heuristics = {
"   \   'tasks/*.yml|meta/*.yml|defaults/*.yml|vars/*.yml|templates/*|files/*|scripts/*': {
"   \     'tasks/*.yml': {'type': 'task'},
"   \     'defaults/*.yml': {'type': 'default'},
"   \     'vars/*.yml': {'type': 'var'},
"   \     'meta/*.yml': {'type': 'meta'},
"   \     'templates/*': {'type': 'template'},
"   \     'files/*': {'type': 'file'},
"   \     'scripts/*': {'type': 'script'},
"   \   }
"   \ }

" autocmd User ProjectionistActivate call s:activate()

" function! s:activate() abort
"   for [root, value] in projectionist#query('wrap')
"     let &l:textwidth = value
"     break
"   endfor
" endfunction
