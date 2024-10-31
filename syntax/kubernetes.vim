if exists('b:current_syntax')
  finish
end

if !exists('main_syntax')
  let g:main_syntax = 'yaml'
endif

let b:current_syntax = ''
unlet b:current_syntax
runtime! syntax/yaml.vim
