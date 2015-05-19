" vim-airline companion theme of Sol
" (https://github.com/Pychimp/vim-moonmusick)
" $base03:    #002b36; 8
" $base02:    #073642; 0
" $base01:    #586e75; 10
" $base00:    #657b83; 11
" $base0:     #839496; 12
" $base1:     #93a1a1; 14
" $base2:     #eee8d5; 7
" $base3:     #fdf6e3; 15
" $yellow:    #b58900; 3
" $orange:    #cb4b16; 9
" $red:       #dc322f; 1
" $magenta:   #d33682; 5
" $violet:    #6c71c4; 13
" $blue:      #268bd2; 4
" $cyan:      #2aa198; 6
" $green:     #859900; 2

let g:airline#themes#moonmusick#palette = {}

let g:airline#themes#moonmusick#palette.accents = {
      \ 'red': [ '#ffffff' , '' , 231 , '' , '' ],
      \ }

let s:N1 = [ '#eee8d5' , '#586e75' , 7 , 10 ]
let s:N2 = [ '#002b36' , '#839496' , 8 , 12 ]
let s:N3 = [ '#002b36' , '#93a1a1' , 8 , 14 ]
let g:airline#themes#moonmusick#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#moonmusick#palette.normal_modified = {
      \ 'airline_c': [ '#dc322f' , '#93a1a1' , 1 , 14 , '' ] ,
      \ }

let s:I1 = [ '#eeeeee' , '#09643f' , 7 , 4  ]
let s:I2 = [ '#073642' , '#839496' , 0 , 12 ]
let s:I3 = [ '#073642' , '#93a1a1' , 0 , 14 ]
let g:airline#themes#moonmusick#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#moonmusick#palette.insert_modified = {
      \ 'airline_c': [ '#dc322f' , '#93a1a1' , 1 , 14 , '' ] ,
      \ }
let g:airline#themes#moonmusick#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , '#2aa198' , s:I1[2] , 6 , '' ] ,
      \ }



let g:airline#themes#moonmusick#palette.replace = copy(g:airline#themes#moonmusick#palette.insert)
let g:airline#themes#moonmusick#palette.replace.airline_a = [ s:I1[0] , '#dc322f' , s:I1[2] , 1 , '' ]
let g:airline#themes#moonmusick#palette.replace.airline_z = [ s:I1[0] , '#dc322f' , s:I1[2] , 1 , '' ]
let g:airline#themes#moonmusick#palette.replace_modified = g:airline#themes#moonmusick#palette.insert_modified

let s:V1 = [ '#eee8d5' , '#d33682' , 7 , 5 ]
let s:V2 = [ '#073642' , '#839496' , 0 , 12 ]
let s:V3 = [ '#073642' , '#93a1a1' , 0 , 14 ]
let g:airline#themes#moonmusick#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#moonmusick#palette.visual_modified = {
      \ 'airline_c': [ '#dc322f' , '#93a1a1' , 1 , 14 , '' ] ,
      \ }

let s:IA = [ '#657b83' , '#93a1a1' , 11 , 14 , '' ]
let g:airline#themes#moonmusick#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#moonmusick#palette.inactive_modified = {
      \ 'airline_c': [ '#dc322f' , '#93a1a1' , 1 , 14 , '' ] ,
       \ }

let g:airline#themes#moonmusick#palette.tabline = {
      \ 'airline_tab':      ['#073642', '#657b83',  0, 11, ''],
      \ 'airline_tabsel':   ['#ffffff', '#004b9a',  231, 31 , ''],
      \ 'airline_tabtype':  ['#073642', '#839496',  0, 12, ''],
      \ 'airline_tabfill':  ['#073642', '#93a1a1',  0, 14, ''],
      \ 'airline_tabmod':   ['#073642', '#b58900',  0, 3, ''],
      \ }

let s:WI = [ '#eee8d5', '#cb4b16', 7, 9 ]
let g:airline#themes#moonmusick#palette.normal.airline_warning = [
     \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
     \ ]

let g:airline#themes#moonmusick#palette.normal_modified.airline_warning =
    \ g:airline#themes#moonmusick#palette.normal.airline_warning

let g:airline#themes#moonmusick#palette.insert.airline_warning =
    \ g:airline#themes#moonmusick#palette.normal.airline_warning

let g:airline#themes#moonmusick#palette.insert_modified.airline_warning =
    \ g:airline#themes#moonmusick#palette.normal.airline_warning

let g:airline#themes#moonmusick#palette.visual.airline_warning =
    \ g:airline#themes#moonmusick#palette.normal.airline_warning

let g:airline#themes#moonmusick#palette.visual_modified.airline_warning =
    \ g:airline#themes#moonmusick#palette.normal.airline_warning

let g:airline#themes#moonmusick#palette.replace.airline_warning =
    \ g:airline#themes#moonmusick#palette.normal.airline_warning

let g:airline#themes#moonmusick#palette.replace_modified.airline_warning =
    \ g:airline#themes#moonmusick#palette.normal.airline_warning

if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#moonmusick#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#002b36' , '#93a1a1' , 8 , 14 , ''     ] ,
      \ [ '#002b36' , '#586e75' , 8 , 12 , ''     ] ,
      \ [ '#eee8d5' , '#268bd5' , 7 , 4  , ''     ] )
