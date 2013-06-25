"colorscheme zenburn
"set background=dark
set tabstop=8
set expandtab               " convert tabs to spaces
set softtabstop=4
set shiftwidth=4
set colorcolumn=80          " print marker at specified column
set tabpagemax=15
set showtabline=2
set ruler                   " show cursor position in status bar
set showcmd                 " show typed command in status bar
syntax on
filetype indent plugin on
call pathogen#infect()

set laststatus=2            " use 2 lines for status bar
set matchpairs+=<:>         " add < & > to quote and bracket pair search
set matchtime=2             " show matching brace for 0.2 seconds
set title                   " show filename in status bar
set showmode                " show mode in status bar
set showmatch               " show matching braces
set number                  " show line numbers

set smartcase               " smart case handling - case insensitive, but not 
                            " when using uppercase
set hidden                  " remember undo after quitting

"set hlsearch                " highlight search results
set incsearch               " search as you type

" toggle paste / nopaste
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

" remember last position of cursor within buffer, but don't do that for
" invalid position or when inside an event handler
if has("autocmd")
  autocmd BufReadPost * 
      \ if line("'\"") > 0 && line("'\"") <= line("$") | 
      \   exe "normal g`\"" | 
      \ endif 
endif

set foldmethod=indent       " enable folding based on indentation
set nofoldenable            " disable automatic folding on file opening

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
