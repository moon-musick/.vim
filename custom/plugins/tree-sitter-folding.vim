if has('nvim')
  augroup treesitter_folding
    autocmd!
    autocmd FileType css,html,javascript,json,go,lua,php,python,ruby,rust,sh,tex,toml setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
  augroup END
endif

