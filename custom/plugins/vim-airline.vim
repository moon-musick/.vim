" disable powerline font and triangular field separators
let g:airline_powerline_fonts = 1
let g:airline_left_sep        = ''
let g:airline_right_sep       = ''

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.notexists = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = ''
let g:airline_symbols.readonly = '⭤'

" only show encoding if it is not standard (i.e. non-utf8 and not
" LF-terminated)
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
