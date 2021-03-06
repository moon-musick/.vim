" Plug setup ------------------------------------------------------------------

" plugins installed in separate file to facilitate unattented installation
source ~/.vim/custom/plug.vim

" indentation and syntax options ----------------------------------------------

" tab settings
set tabstop=2

" convert tabs to spaces
set expandtab

" number of spaces inserted for tab pressed or when using backspace
set softtabstop=2
set shiftwidth=2

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
augroup indentation
  autocmd!
  autocmd FileType python,haskell,markdown setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent
  autocmd FileType lokis setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent
  autocmd FileType votl setlocal softtabstop=4
augroup END

" filetype recognition
augroup filetype_setting
  autocmd!
  autocmd BufRead,BufNewFile *.rsc  set filetype=rsc
  autocmd BufRead,BufNewFile *.ks   set filetype=kickstart
  autocmd BufRead,BufNewFile *.html set filetype=html
  autocmd BufRead,BufNewFile *.css  set filetype=css
  autocmd BufRead,BufNewFile *.j2   set filetype=jinja
  autocmd BufRead,BufNewFile *.rs   set filetype=rust
augroup END

" enable omnicompletion for ruby and python
augroup completion
  autocmd!
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1
  autocmd FileType python set omnifunc=pythoncomplete#Complete
augroup END

" use autopep8 for python autoformat
augroup python_formatting
  autocmd!
  autocmd FileType python setlocal formatprg=autopep8\ -
  autocmd FileType python nnoremap <leader>y :0,$!yapf<CR>
augroup END

" key mappings ----------------------------------------------------------------

" change mapleader for convenience
let mapleader=" "

" swap mark jump commands
nnoremap ` '
nnoremap ' `

" toggle display of whitespace characters
nmap <leader>l :set list!<CR>

" set characters for whitespace display
set listchars=tab:»\ ,eol:¬

" set shortcuts for moving between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" nmap <leader>ws <c-w>s
" nmap <leader>wv <c-w>v
nnoremap <leader>- :resize -5<CR>
nnoremap <leader>+ :resize +5<CR>
nnoremap <leader>, :vertical resize -5<CR>
nnoremap <leader>. :vertical resize +5<CR>

" equalize visible buffers
nnoremap <leader>we <c-w>=
nnoremap <leader>=  <c-w>=

" maximize current buffer
nnoremap <leader>wf <c-w><bar><c-w>_

" rotate split buffers
nmap <leader>H <c-w>H
nmap <leader>J <c-w>J
nmap <leader>K <c-w>K
nmap <leader>L <c-w>L

" set shortcuts for moving between tabs
nnoremap <leader>p :tabprevious<CR>
nnoremap <leader>n :tabnext<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <C-n> :bnext<CR>

" switch to the alternate (last used) buffer
nnoremap <C-e> <C-^>

" delete buffer
nnoremap <leader>d :bdelete<CR>

" map write and quit to something more sensible
nnoremap <leader>ww :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>Q  :qa!<CR>
nnoremap <leader>u  :update<CR>
nnoremap <leader>x  :xit<CR>

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

" mapping for navigating visual lines
" http://andrewradev.com/2011/04/26/my-vim-workflow-basic-moves/
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" easily edit configuration files
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>ep :edit ~/.vim/custom/plug.vim<CR>

" more consistent n/N behaviour
" https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

" http://mixandgo.com/blog/vim-config-for-rails-ninjas
" Visually select the text that was last edited/pasted
nnoremap gV `[v`]
" select what you've just pasted
nnoremap gp `[v`]
" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
" indent or de-indent a pasted block
nnoremap <leader>> `[v`]>
nnoremap <leader>< `[v`]<
" remap C-c in insert mode so that it triggers InsertLeave
inoremap <C-c> <Esc>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>r :nohlsearch<CR>:redraw!<CR>

" quickly edit your macros
" https://github.com/mhinz/vim-galore#quickly-edit-your-macros
nnoremap <leader>m :<C-u><C-r>='let @'. v:register .' = '. string(getreg(v:register))<CR><C-f><Left>

" syntastic mappings
map <leader>sc :lclose<CR>
map <leader>so :SyntasticCheck<CR>

" preserve flags from previous :substitute invocation
" Practical Vim by Drew Neill, p. 227
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" plugin key mappings ---------------------------------------------------------

" CtrlP
let g:ctrlp_map = ''
nmap <leader>o :CtrlP<CR>
nmap <leader>h :CtrlPMRUFiles<CR>
nmap <leader>b :CtrlPBuffer<CR>

" set shortcut for nerdtree plugin
nmap <leader>t :NERDTreeToggle<CR>

" https://github.com/junegunn/vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga      <Plug>(EasyAlign)

" hdevtools mappings
augroup haskell
  autocmd!
  autocmd FileType haskell nnoremap <buffer> <leader>ht :HdevtoolsType<CR>
  autocmd FileType haskell nnoremap <buffer> <leader>hc :HdevtoolsClear<CR>
  autocmd FileType haskell nnoremap <buffer> <leader>hi :HdevtoolsInfo<CR>
augroup END

" indentLine mappings
nmap <leader>i :IndentLinesToggle<CR>

" gundo toggle shortcut
nnoremap <F6> :UndotreeToggle<CR>

" vim-grepper custom command
nnoremap <leader>/ :Rg<Space>

" vim-interestingwords
let g:interestingWordsDefaultMappings = 0
nnoremap <silent> <leader>a :call InterestingWords('n')<CR>
vnoremap <silent> <leader>a :call InterestingWords('v')<CR>
nnoremap <silent> <leader>A :call UncolorAllWords()<CR>
nnoremap <silent> n :call WordNavigation(1)<CR>
nnoremap <silent> N :call WordNavigation(0)<CR>

" vim-buftabline
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" vim-operator-flashy
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
let g:operator#flashy#group = 'Error'

" general stuff ---------------------------------------------------------------

" use exrc but disable shell & writing stuff
set exrc
set secure

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
set history=2000

" folding settings
" enable folding based on indentation
set foldmethod=indent
" disable automatic folding on file opening
set nofoldenable

" delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" 7.4.427 fixes terminal rendering glitches
if v:version > 704 || v:version == 704 && has ("patch427")
  set updatetime=250
endif

" remember last position of cursor within buffer, but don't do that for
" invalid position or when inside an event handler
augroup cursors
  autocmd!
  autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
augroup END

" autoload VIMRC after editing
augroup vimrc
  autocmd!
  autocmd BufWritePost .vimrc so $MYVIMRC
augroup END

" enable textobj-rubyblock matching
runtime macros/matchit.vim

" path expansion mapping for command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" smarter command-line history
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

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

" reading files via ssh into buffer
function! SSHFile(hostname, filename)
  execute "r!" . "ssh " . a:hostname . " cat " . a:filename
endfunction

command! -complete=file -nargs=* SSHFile :call SSHFile(<f-args>)

nnoremap <leader>sh :SSHFile<Space>

" easier map for setting syntax coloring for a specific filetype
nnoremap <leader>ft :set ft=

" plugin configuration --------------------------------------------------------

source ~/.vim/custom/plugins/autoformat.vim
source ~/.vim/custom/plugins/YouCompleteMe.vim
source ~/.vim/custom/plugins/syntastic.vim
source ~/.vim/custom/plugins/vim-commentary.vim
source ~/.vim/custom/plugins/vim-go.vim
source ~/.vim/custom/plugins/UltiSnips.vim
source ~/.vim/custom/plugins/python-syntax.vim
source ~/.vim/custom/plugins/fugitive-gitlab.vim
source ~/.vim/custom/plugins/indentLine.vim
source ~/.vim/custom/plugins/delimitMate.vim
source ~/.vim/custom/plugins/vim-airline.vim
source ~/.vim/custom/plugins/vim-grepper.vim

" autoclose nerdtree window if closing all other windows and exit
augroup nerdtree
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
" delete unneeded buffers left by browsing
augroup fugitive
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" vim-buftabline
let g:buftabline_numbers = 2

" custom scripts --------------------------------------------------------------
source ~/.vim/custom/scripts/perltidy.vim

" abbreviations ---------------------------------------------------------------
source ~/.vim/custom/abbreviations.vim

" backlog functions -----------------------------------------------------------
source ~/.vim/custom/backlog.vim

" apperarance stuff -----------------------------------------------------------

" colors support indication
set t_Co=256
" set t_Co=16

" GUI font setting
if has('gui_running')
  set guifont=Inconsolata\ 11
endif

" disable toolbars in GUI
set guioptions=c

" make vertical windows separator thinner
set fillchars=vert:│
highlight VertSplit ctermbg=NONE guibg=NONE

" print marker at specified column
set colorcolumn=80

" set the total number of tabs to be opened with the -p command line option
set tabpagemax=30

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

" show cursorline
set cursorline

" show cursorline only in active window
augroup highlight_follows_focus
  autocmd!
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END

" colorscheme settings
set background=dark
" colorscheme gruvbox
colorscheme solarized
highlight TabLineFill ctermbg=NONE guibg=NONE
call togglebg#map("<F5>")

let anyfold_activate=1
let anyfold_fold_comments=1
set foldlevel=0
highlight Folded term=NONE cterm=NONE

" set SignColumn color equal to general background
highlight SignColumn ctermbg=NONE guibg=NONE

language en_US.utf8
