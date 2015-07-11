" pathogen --------------------------------------------------------------------

" required setting for some plugins
set nocompatible
" turn off filetype detection for pathogen call
filetype off
" call pathogen
call pathogen#incubate()
call pathogen#helptags()
" set filetype detection back on
filetype on

" apperarance stuff -----------------------------------------------------------

" colorscheme settings
set background=dark
colorscheme solarized
" colors support indication
" set t_Co=256
set t_Co=16
let g:solarized_termcolors=16

" toggle background color mapping
call togglebg#map('<F5>')

" GUI font setting
if has('gui_running')
    " set guifont=Liberation\ Mono\ for\ Powerline\ Bold\ 9
    set guifont=Inconsolata\ for\ Powerline\ 11
endif

" disable toolbars in GUI
set guioptions-=m
set guioptions-=r
set guioptions-=T
set guioptions-=e

" make vertical windows separator thinner
set fillchars=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

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

" custom statusline
set statusline=\ %F
set statusline+=\ %r%h%w
set statusline+=\ %{fugitive#statusline()}\ 
set statusline+=\ %1*%m%*
set statusline+=\ %=%{v:register}\ 
set statusline+=\ %y
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}]
set statusline+=\ [line\ %l\/%L]
set statusline+=\ %4v\ 
set statusline+=\ 0x%04B\ 
" used in statusline
hi User1 ctermfg=0 ctermbg=1

" indentation and syntax options ----------------------------------------------

" tab settings
set tabstop=2

" convert tabs to spaces
set expandtab

" number of spaces inserted for tab pressed or when using backspace
set softtabstop=2
set shiftwidth=2

" settings for indent-guides
let g:indent_guides_guide_size=2

" add < & > to quote and bracket pair search
set matchpairs+=<:>

" show matching brace for 0.2 seconds
set matchtime=2

" enable backspace over newlines, inserted chars and autoindent in insert mode
set backspace=start,eol,indent

" enable syntax coloring
syntax on

" enable indentation based on filetype
filetype indent plugin on

" search options --------------------------------------------------------------

" smart case handling - case insensitive, but not when using uppercase
set smartcase
" enable hidden buffers (switch to other buffer without saving first)
set hidden
" highlight search results
set hlsearch
" search as you type
set incsearch

" filetype-related stuff ------------------------------------------------------

" different indentation settings for various languages
autocmd FileType ruby,cucumber,erb,yaml,html,css,scss,coffee setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent
autocmd FileType python,haskell setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent
autocmd FileType lokis setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent

" filetype recognition
autocmd BufRead,BufNewFile *.rsc  set filetype=rsc
autocmd BufRead,BufNewFile *.ks   set filetype=kickstart
autocmd BufRead,BufNewFile *.html set filetype=html
autocmd BufRead,BufNewFile *.css  set filetype=css
autocmd BufRead,BufNewFile *.j2   set filetype=jinja

" enable omnicompletion for ruby and python
if has ("autocmd")
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby let g:rubycomplete_buffer_loading=1
    autocmd FileType ruby let g:rubycomplete_classes_in_global=1
    autocmd FileType python set omnifunc=pythoncomplete#Complete
end

" different indent guides settings for specific filetypes
if has ("autocmd")
    autocmd FileType ruby,cucumber,yaml,css,scss,html,coffee let g:indent_guides_guide_size=2
end

" key mappings ----------------------------------------------------------------

" change mapleader for convenience
let mapleader=" "

" remap backslash to reverse char search
noremap \ ,

" swap mark jump commands
nnoremap ` '
nnoremap ' `

" toggle display of whitespace characters
nmap <leader>l :set list!<CR>

" set characters for whitespace display
set listchars=tab:»\ ,eol:¬

" set shortcut for nerdtree plugin
nmap <leader>tr :NERDTreeToggle<CR>

" autoclose nerdtree window if closing all other windows and exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" set shortcut for ack plugin
nmap <leader>a <Esc>:Ack!

" use ag instead of ack (better performance)
let g:ackprg = 'ag --nogroup --nocolor --column'

" set shortcuts for moving between windows
map <c-j> <c-w>j
nmap <leader>wj <c-w>j
map <c-k> <c-w>k
nmap <leader>wk <c-w>k
map <c-l> <c-w>l
nmap <leader>wl <c-w>l
map <c-h> <c-w>h
nmap <leader>wh <c-w>h
nmap <leader>ws <c-w>s
nmap <leader>wv <c-w>v
nmap <leader>w- <c-w>-
nmap <leader>w+ <c-w>+
nmap <leader>we <c-w>=

" mazimize window
nmap <leader>wf <c-w><bar><c-w>_

" set shortcuts for moving between tabs
map <leader>p <esc>:tabprevious<CR>
map <leader>n <esc>:tabnext<CR>

" switch buffers
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bl :buffers<CR>
nmap <leader>bd :bdelete<CR>

" gundo toggle shortcut
nnoremap <F6> :GundoToggle<CR>

" map write to something more sensible
nnoremap <leader>ww :w<CR>

" provide easy Tagbar toggle
nmap <F8> :TagbarToggle<CR>

" disable Ex mode shortcut
nnoremap Q <nop>

" disable accidental help triggering
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

" spelling
nmap <silent> <leader>sp :set spelllang=pl spell!<CR>

" map omnifunc completion to something more convenient
inoremap <C-f> <C-x><C-o>

" CtrlP mappings
let g:ctrlp_map = '<C-p>'

" mapping for navigating visual lines
" http://andrewradev.com/2011/04/26/my-vim-workflow-basic-moves/
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" zeal mapping
:nnoremap gz :!zeal --query "<cword>"&<CR><CR>

" https://github.com/Lokaltog/vim-easymotion two character search
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" easier search highlighting clearing
nmap <leader>hl :nohlsearch<CR>

" new tab shortcut
nmap <leader>tn :tabnew

" http://mixandgo.com/blog/vim-config-for-rails-ninjas
" Visually select the text that was last edited/pasted
nnoremap gV `[v`]
" select what you've just pasted
nnoremap gp `[v`]
" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
" remap C-c in insert mode so that it triggers InsertLeave
inoremap <C-c> <Esc>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>rd :redraw!<CR>

" syntastic mappings
map <leader>sc :lclose<CR>
map <leader>so :SyntasticCheck<CR>

" ruby-xmpfilter mappings
autocmd FileType ruby nmap <buffer> <F2> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <F2> <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <F2> <Plug>(xmpfilter-mark)
autocmd FileType ruby nmap <buffer> <F3> <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <F3> <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <F3> <Plug>(xmpfilter-run)

" preserve flags from previous :substitute invocation
" Practical Vim by Drew Neill, p. 227
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" https://github.com/junegunn/vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga      <Plug>(EasyAlign)

" hdevtools mappings
au FileType haskell nnoremap <buffer> <leader>ht :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <leader>hc :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <leader>hi :HdevtoolsInfo<CR>

" general & plugin-related stuff ----------------------------------------------

" disable backups
set nobackup
set nowritebackup
set noswapfile

" split settings
set splitbelow
set splitright

" automatically read files changed outside of vim
set autoread

" hide intro
set shortmess+=I

" set zsh-like completion mode
set wildmenu
set wildmode=longest,list,full

" enable longer history
set history=200

" folding settings
" enable folding based on indentation
set foldmethod=indent
" disable automatic folding on file opening
set nofoldenable

" enable man plugin - makes reading man pages in vim possible
runtime! ftplugin/man.vim

" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
" delete unneeded buffers left by browsing
autocmd BufReadPost fugitive://* set bufhidden=delete

" remember last position of cursor within buffer, but don't do that for
" invalid position or when inside an event handler
if has("autocmd")
  autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
endif

" autoload VIMRC after editing
au BufWritePost .vimrc so $MYVIMRC

" enable textobj-rubyblock matching
runtime macros/matchit.vim

" path expansion mapping for command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" powerline separators for tmuxline
" let g:tmuxline_separators = {
"     \ 'left' : '',
"     \ 'left_alt': '',
"     \ 'right' : '',
"     \ 'right_alt' : '',
"     \ 'space' : ' '}

" set better completion in command mode
" (enable completion from history after with partial input given)
" TODO; find out why it doesn't work
" cnoremap <C-p> <Up>
" cnoremap <C-n> <Down>

" stripping whitespace - http://vimcasts.org/episodes/tidying-whitespace/
" function! <SID>StripTrailingWhitespaces()
function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <F7> :call StripTrailingWhitespaces()<CR>

" quick buffer switching
" :nnoremap <leader>s :ls<CR>:b<Space>

" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" enable syntastic checks
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

" force syntastic to use python3
"let g:syntastic_python_python_exe = 'python3'

" neco-ghc completion https://github.com/eagletmt/neco-ghc
let g:ycm_semantic_triggers = {'haskell': ['.']}

" vim-commentary configuration
source ~/.vim/custom/plugins/vim-commentary.vim

" tagbar configuration
source ~/.vim/custom/plugins/tagbar.vim

" vim-taskwarrior configuration
source ~/.vim/custom/plugins/taskwarrior.vim

" vim-go configuration
source ~/.vim/custom/plugins/vim-go.vim
