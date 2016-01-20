" enable syntastic checks
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

" force syntastic to use python3
"let g:syntastic_python_python_exe = 'python3'

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['go']}
