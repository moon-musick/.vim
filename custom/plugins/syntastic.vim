" enable syntastic checks
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

" force syntastic to use python3
"let g:syntastic_python_python_exe = 'python3'

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['go', 'ansible']}
let g:go_list_type = "quickfix"
" let g:syntastic_ansible_checkers = ['ansible_lint']
" let g:syntastic_ansible_checkers_ansible_lint_exec = '/usr/local/bin/ansible-lint'

let g:syntastic_aggregate_errors = 1
