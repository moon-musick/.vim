" required setting for some plugins
set nocompatible
" turn off filetype detection for pathogen call
filetype off
" call pathogen
"call pathogen#infect()
" call pathogen#runtime_append_all_bundles()
call pathogen#incubate()
call pathogen#helptags()
" set filetype detection back on
filetype on

" direct editing options
" colorscheme settings
set background=dark
colorscheme solarized
set t_Co=16
let g:solarized_termcolors=16
call togglebg#map('<F5>')
" tab settings
set tabstop=8
" convert tabs to spaces
set expandtab
" number of spaces inserted for tab pressed or when using backspace
set softtabstop=4
set shiftwidth=4
" different settings for Ruby
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent
" settings for HTML and CSS
autocmd FileType html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent
autocmd FileType css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent
" add < & > to quote and bracket pair search
set matchpairs+=<:>
" show matching brace for 0.2 seconds
set matchtime=2

" layout settings
" enable powerline
set rtp+=$HOME/.local/lib/python3.2/site-packages/powerline/bindings/vim/
" print marker at specified column
set colorcolumn=80
" set the total number of tabs to be opened with the -p command line option
set tabpagemax=15
" always show the tabs bar
set showtabline=2
" show cursor position in status bar
set ruler
" show typed command in status bar
set showcmd
" show filename in status bar
set title
" show mode in status bar
set showmode
" show matching braces
set showmatch
" show line numbers
set number
" use 2 lines for status bar
set laststatus=2
" enable syntax coloring
syntax on
" enable indentation based on filetype
filetype indent plugin on
" set colors
"colorscheme zenburn
"set background=dark


" disable backups
set nobackup
set nowritebackup
set noswapfile

" search options
" smart case handling - case insensitive, but not when using uppercase
set smartcase
" remember undo after quitting
set hidden
" highlight search results
"set hlsearch
" search as you type
set incsearch

" key mappings
" change mapleader for convenience
let mapleader=","
" toggle display of whitespace characters
nmap <leader>l :set list!<CR>
" set characters for whitespace display
set listchars=tab:»\ ,eol:¬
" toggle paste / nopaste
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>
" set shortcut for command-t plugin
nmap <leader>ct :CommandT<CR>
" set shortcut for nerdtree plugin
nmap <leader>t :NERDTree<CR>
" autoclose nerdtree window if closing all other windows and exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" set shortcut for ack plugin
nmap <leader>a <Esc>:Ack!
" set shortcuts for moving between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" set shortcuts for moving between tabs
map <leader>n <esc>:tabprevious<CR>
map <leader>m <esc>:tabnext<CR>

" remember last position of cursor within buffer, but don't do that for
" invalid position or when inside an event handler
if has("autocmd")
  autocmd BufReadPost * 
      \ if line("'\"") > 0 && line("'\"") <= line("$") | 
      \   exe "normal g`\"" | 
      \ endif 
endif

" folding settings
" enable folding based on indentation
set foldmethod=indent
" disable automatic folding on file opening
set nofoldenable

" enable syntastic checks
let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" MikroTik script / export file recognition
autocmd BufRead,BufNewFile *.rsc set filetype=rsc

" kickstart file recognition
autocmd BufRead,BufNewFile *.ks set filetype=kickstart
" html file recognition
autocmd BufRead,BufNewFile *.html set filetype=html
" css file recognition
autocmd BufRead,BufNewFile *.css set filetype=css

" force syntastic to use python3
"let g:syntastic_python_python_exe = 'python3'
"enable omnicompletion for ruby
if has ("autocmd")
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby let g:rubycomplete_buffer_loading=1
    autocmd FileType ruby let g:rubycomplete_classes_in_global=1
    autocmd FileType python set omnifunc=pythoncomplete#Complete
end
