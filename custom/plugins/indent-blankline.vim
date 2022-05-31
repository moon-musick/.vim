" indent blankline settings
if has('nvim')
  let g:indent_blankline_show_current_context    = v:true
  let g:indent_blankline_show_first_indent_level = v:false
  let g:indent_blankline_use_treesitter          = v:true

  highlight IndentBlanklineChar               guifg=#3c3836 gui=nocombine
  highlight IndentBlanklineSpaceCharBlankline guifg=#3c3836 gui=nocombine
  highlight IndentBlanklineContextChar        guifg=#fbf1c7 gui=nocombine
endif

