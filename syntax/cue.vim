if exists("b:current_syntax")
  finish
endif

syntax keyword CUEType      FILE TRACK AUDIO WAVE
syntax keyword CUEKeyword   PERFORMER TITLE INDEX REM DISCID COMMENT
syntax match   CUEPosition  "[0-9][0-9]:[0-9][0-9]:[0-9][0-9]"
syntax region  CUEString    start=/\v"/ end=/\v"/ oneline

highlight default link CUEType     Type
highlight default link CUEKeyword  Keyword
highlight default link CUEPosition Identifier
highlight default link CUEString   String

let b:current_syntax = "cue"
