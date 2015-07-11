" vim-go
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage)

" By default the mapping gd is enabled which opens the target identifier
" in current buffer. You can also open the definition/declaration in a new
" vertical, horizontal or tab for the word under your cursor:
autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Open the relevant Godoc for the word under the cursor with <leader>gd
" or open it vertically with <leader>gv
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Show a list of interfaces which is implemented by the type under your
" cursor with <leader>s
autocmd FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor with <leader>i
" (useful if you have disabled auto showing type info via g:go_auto_type_info)
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" Rename the identifier under the cursor to a new name
autocmd FileType go nmap <Leader>e <Plug>(go-rename)

" Additional highlighting rules
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_structs           = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info              = 1

let $GOROOT = "/usr/local/go"
let $GOPATH = $HOME . "/go"
