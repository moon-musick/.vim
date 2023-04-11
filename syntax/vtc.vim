if exists("b:current_syntax")
  finish
endif

syntax keyword VTCFunction txreq txresp expect rxresp
syntax keyword VTCKeyword varnish varnishtest client
syntax keyword VTCType req resp
syntax match   VTCComment "^\s*#.*$"
syntax match   VTCString '"[^"]\+"'
syntax match   VTCHTTPResponse '\<[1-5][0-9][0-9]\>'
syntax match   VTCOperator '=='

highlight link VTCFunction     TSFunction
highlight link VTCKeyword      TSKeyword
highlight link VTCComment      TSComment
highlight link VTCString       TSString
highlight link VTCHTTPResponse TSNumber
highlight link VTCBracket      TSPunctBracket
highlight link VTCOperator     TSKeywordOperator
highlight link VTCType         TSType

let b:current_syntax = "vtc"
