" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" enable completion in strings and comments
let g:ycm_complete_in_strings  = 1
let g:ycm_complete_in_comments = 1

" enable collection of tokens from strings and comments
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" neco-ghc completion https://github.com/eagletmt/neco-ghc
let g:ycm_semantic_triggers = {'haskell': ['.']}

let g:ycm_server_keep_logfiles = 1

let g:ycm_server_python_interpreter = '/usr/bin/python3'
