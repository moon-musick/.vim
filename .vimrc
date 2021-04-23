scriptencoding utf-8

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

" disable line wrapping by default
set nowrap

" preserve indentation when visually wrapping lines
set breakindent

" mark wrapped lines with this string
let &showbreak = '+ '

" disable syntax highlighting for very long lines
set synmaxcol=512

" disable joining lines with two spaces after a period sign
set nojoinspaces

" disable redraw during macro execution etc.
set lazyredraw

" search options --------------------------------------------------------------

" smart case handling - case insensitive, but not when using uppercase
set ignorecase
set smartcase
" enable hidden buffers (switch to other buffer without saving first)
set hidden
" highlight search results
set hlsearch
" search as you type
set incsearch
" interactive replacement preview with :substitute in Neovim
if has('nvim')
  set inccommand=nosplit
endif

" filetype-related stuff ------------------------------------------------------

" different indentation settings for various languages
augroup indentation_settings
  autocmd!
  autocmd FileType python,haskell,markdown setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent
  autocmd FileType lokis setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent
  autocmd FileType votl setlocal softtabstop=4
augroup END

" filetype recognition
augroup filetype_settings
  autocmd!
  autocmd BufRead,BufNewFile *.rsc  set filetype=rsc
  autocmd BufRead,BufNewFile *.ks   set filetype=kickstart
  autocmd BufRead,BufNewFile *.html set filetype=html
  autocmd BufRead,BufNewFile *.css  set filetype=css
  autocmd BufRead,BufNewFile *.j2   set filetype=jinja
  autocmd BufRead,BufNewFile *.rs   set filetype=rust
augroup END

" enable omnicompletion for ruby and python
augroup completion_settings
  autocmd!
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1
  " autocmd FileType python set omnifunc=pythoncomplete#Complete
  " autocmd FileType python setlocal omnifunc=lsp#complete
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END

augroup fish
  autocmd!
  autocmd FileType fish compiler fish
  autocmd FileType fish setlocal textwidth=79
  autocmd FileType fish setlocal foldmethod=expr
augroup END

" use autopep8 for python autoformat
augroup python_formatting
  autocmd!
  autocmd FileType python setlocal formatprg=autopep8\ -
  autocmd FileType python nnoremap <leader>y :Black<CR>
  " autocmd FileType python nnoremap <leader>y :0,$!yapf<CR>
augroup END

augroup vcl
  autocmd!
  autocmd FileType vcl setlocal commentstring=#\ %s
augroup END

" key mappings ----------------------------------------------------------------

" copying and pasting to/from system clipboard
nnoremap cv "+p
nnoremap cp "+y
xnoremap cv "+p
xnoremap cp "+y

" change mapleader for convenience
let g:mapleader=' '

" swap mark jump commands
nnoremap ` '
nnoremap ' `

" toggle display of whitespace characters
nnoremap <leader>li :set list!<CR>

" set characters for whitespace display
set listchars=tab:»\ ,eol:¬

" set shortcuts for moving between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
" nnoremap <leader>ws <c-w>s
" nnoremap <leader>wv <c-w>v
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
nnoremap <leader>H <c-w>H
nnoremap <leader>J <c-w>J
nnoremap <leader>K <c-w>K
nnoremap <leader>L <c-w>L

" set shortcuts for moving between tabs
nnoremap <leader>p :tabprevious<CR>
nnoremap <leader>n :tabnext<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <C-n> :bnext<CR>

" switch to the alternate (last used) buffer
nnoremap <C-e> <C-^>

" delete buffer, leave window intact
nnoremap <leader>d :Sayonara!<CR>
" delete buffer and close window
nnoremap <leader>x :Sayonara<CR>
" nnoremap <leader>d :enew<bar>bdelete #<CR>
" nnoremap <leader>x :bdelete<CR>
nnoremap <leader>D :bdelete!<CR>

" open new split
nnoremap <leader>vv :vnew<Space>
nnoremap <leader>ss :new<Space>
nnoremap <leader>ee :edit<Space>
nnoremap <leader>fe :tabedit<Space>
" close current tab
nnoremap <leader>fd :tabclose<CR>

" open new tab with current buffer and move to the same position
function! OpenCurentBufferInNewTab()
  let l:l = line('.')
  let l:c = col('.')
  tabedit %
  call cursor(l:l, l:c)
endfunction
nnoremap <leader>ff :call OpenCurentBufferInNewTab()<CR>

" map write and quit to something more sensible
" nnoremap <leader>ww :w<CR>
nnoremap <leader>ww :update<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>qq :quit<CR>
nnoremap <leader>Q  :qa!<CR>
nnoremap <C-q>      :confirm qall<CR>
nnoremap <leader>X  :close<CR>

" use Q for macro repeat instead of Ex command mode trigger
nnoremap Q @@

" disable accidental help triggering
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

" spelling
nnoremap <silent> <leader>sp :setlocal spelllang=pl spell!<CR>
nnoremap <silent> <leader>se :setlocal spelllang=en_US spell!<CR>
nnoremap <silent> <leader>sb :setlocal spelllang=en_GB spell!<CR>

" map omnifunc completion to something more convenient
inoremap <C-f> <C-x><C-o>

" mapping for navigating visual lines
" http://andrewradev.com/2011/04/26/my-vim-workflow-basic-moves/
" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
"
" use 'j' if preceded by count, 'gj' otherwise. same for 'k' and 'gk'
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
xnoremap <expr> j v:count ? 'j' : 'gj'
xnoremap <expr> k v:count ? 'k' : 'gk'
" make original movements still available
nnoremap <silent> gj j
nnoremap <silent> gk k
xnoremap <silent> gj j
xnoremap <silent> gk k

" easily edit configuration files
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>ep :edit ~/.vim/custom/plug.vim<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

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

" Move line up or down
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
" Move visual block up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <leader>r :nohlsearch<CR>:redraw!<CR>

" quickly edit your macros
" https://github.com/mhinz/vim-galore#quickly-edit-your-macros
nnoremap <leader>m :<C-u><C-r>='let @'. v:register .' = '. string(getreg(v:register))<CR><C-f><Left>

" preserve flags from previous :substitute invocation
" Practical Vim by Drew Neill, p. 227
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" neovim terminal navigation
" https://neovim.io/doc/user/nvim_terminal_emulator.html
" if has('nvim')
"   tnoremap <A-h> <C-\><C-N><C-w>h
"   tnoremap <A-j> <C-\><C-N><C-w>j
"   tnoremap <A-k> <C-\><C-N><C-w>k
"   tnoremap <A-l> <C-\><C-N><C-w>l
"   inoremap <A-h> <C-\><C-N><C-w>h
"   inoremap <A-j> <C-\><C-N><C-w>j
"   inoremap <A-k> <C-\><C-N><C-w>k
"   inoremap <A-l> <C-\><C-N><C-w>l
"   nnoremap <A-h> <C-w>h
"   nnoremap <A-j> <C-w>j
"   nnoremap <A-k> <C-w>k
"   nnoremap <A-l> <C-w>l
" endif

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>
tnoremap <A-h> <C-\><C-N>:TmuxNavigateLeft<cr>
tnoremap <A-j> <C-\><C-N>:TmuxNavigateDown<cr>
tnoremap <A-k> <C-\><C-N>:TmuxNavigateUp<cr>
tnoremap <A-l> <C-\><C-N>:TmuxNavigateRight<cr>

" neoterm configuration
let g:neoterm_position = 'vertical'
vnoremap <silent> <F2> :TREPLSendSelection<CR>
nnoremap <silent> <F2> :TREPLSendLine<CR>

nnoremap <silent> <leader>tc :call neoterm#close()<CR>
nnoremap <silent> <leader>tl :call neoterm#clear()<CR>
nnoremap <silent> <leader>tk :call neoterm#kill()<CR>

command! -nargs=+ Tg :T git <args>
command! -nargs=* Tig :T tig <args>
" nnoremap <leader>gg :Tig<Space>

nnoremap <leader>g :grep!<Space>
nnoremap <silent> <leader>co :copen<CR>
nnoremap <silent> <leader>cc :cclose<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprev<CR>

nnoremap <leader>lg :lgrep!<Space>
nnoremap <silent> <leader>lo :lopen<CR>
nnoremap <silent> <leader>lc :lclose<CR>
nnoremap <silent> <leader>ln :lnext<CR>
nnoremap <silent> <leader>lp :lprev<CR>

" plugin key mappings ---------------------------------------------------------

" fzf
nnoremap <leader>o :Files<CR>
nnoremap <leader>hh :History<CR>
nnoremap <leader>: :History:<CR>
nnoremap <leader>b :Buffers<CR>

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
nnoremap <leader>i :IndentLinesToggle<CR>

" gundo toggle shortcut
nnoremap <F6> :UndotreeToggle<CR>

" vim-grepper custom command
nnoremap <leader>/ :GrepperRg<Space>

" ripgrep
set grepprg=rg\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m

" fzf / ripgrep
" '?' toggles a preview window
command! -bang -nargs=* Rip
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" fzf / files
" redefine Files command - enable preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" vim-interestingwords
let g:interestingWordsDefaultMappings = 0
nnoremap <silent> <leader>a :call InterestingWords('n')<CR>
vnoremap <silent> <leader>a :call InterestingWords('v')<CR>
nnoremap <silent> <leader>A :call UncolorAllWords()<CR>
nnoremap <silent> n :call WordNavigation(1)<CR>
nnoremap <silent> N :call WordNavigation(0)<CR>

" vim-sandwich recommendation
nmap s <NOP>
xmap s <NOP>

" zeavim filetype -> docset mappings
let g:zv_file_types = {
  \ 'Dockerfile': 'docker',
  \ 'sh': 'bash',
  \ 'tex': 'latex',
  \ 'yaml.ansible': 'ansible',
  \ 'python': 'python_3'
  \ }

vmap gz <Plug>ZVVisSelection

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

set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.dll
set wildignore+=*/.git/**/*,*/.svn/**/*
set wildignore+=*.tar.*

" enable longer history
set history=2000

" delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

" 7.4.427 fixes terminal rendering glitches
if v:version > 704 || v:version == 704 && has ('patch427')
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
  autocmd BufWritePost init.vim so $MYVIMRC
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
  let l:_s=@/
  let l:l = line('.')
  let l:c = col('.')
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=l:_s
  call cursor(l:l, l:c)
endfunction
nnoremap <F7> :call StripTrailingWhitespaces()<CR>

" reading files via ssh into buffer
function! SSHFile(hostname, filename)
  execute 'r!' . 'ssh ' . a:hostname . ' cat ' . a:filename
endfunction

command! -complete=file -nargs=* SSHFile :call SSHFile(<f-args>)

nnoremap <leader>sh :SSHFile<Space>

" paste stuff into termbin, get back URL
" https://www.reddit.com/r/vim/comments/7bj837/favorite_console_tools_to_use_with_vim/
if executable('nc') && executable('tr') && executable('xclip')
  command! -range=% TB <line1>,<line2>w !nc termbin.com 9999 | tr -d '\n' | xclip -selection clipboard
endif

" leave 3 lines at the top or bottom of view when scrolling up or down
set scrolloff=3

" show option values
" https://www.reddit.com/r/vim/comments/7g4afp/using_tabs_only/
command! -bar -nargs=1 -complete=option Vov echo 'local: '
      \| verbose setlocal <args>?
      \| echo 'global: '
      \| verbose setglobal <args>?

" plugin configuration --------------------------------------------------------

let g:black_linelength = 79

" hexokinase - hex, rgb etc. colours preview
let g:Hexokinase_optInPatterns = [
\ 'full_hex',
\ 'rgb',
\ 'rgba',
\ 'hsl',
\ 'hsla',
\ ]

let g:Hexokinase_highlighters = [
\ 'virtual',
\ ]

source ~/.vim/custom/plugins/autoformat.vim
source ~/.vim/custom/plugins/vim-commentary.vim
source ~/.vim/custom/plugins/vim-go.vim
source ~/.vim/custom/plugins/UltiSnips.vim
source ~/.vim/custom/plugins/python-syntax.vim
source ~/.vim/custom/plugins/fugitive-gitlab.vim
source ~/.vim/custom/plugins/indentLine.vim
source ~/.vim/custom/plugins/delimitMate.vim
source ~/.vim/custom/plugins/vim-airline.vim
source ~/.vim/custom/plugins/fzf.vim

" vim-grepper settings and mappings
let g:grepper = {}
let g:grepper.tools = ['rg', 'git']
nmap gr <Plug>(GrepperOperator)
xmap gr <Plug>(GrepperOperator)

" vimtex
let g:vimtex_view_method = 'zathura'

" vimwiki
" defines a list of wikis with optional properties
let g:vimwiki_list = [
  \   {'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}
  \ ]
" supertab doesn't work in vimwiki pages if this is on
let g:vimwiki_table_mappings = 0
" disable setting filetype for all .md files (outside of vimwiki_list
" locations)
let g:vimwiki_global_ext = 0
" use vim-markdown-folding
let g:vimwiki_folding = 'expr'

map <leader><F8> <Plug>VimwikiToggleListItem

" <leader>ww by default
nmap <leader>wo <Plug>VimwikiIndex
nmap <leader>wj <Plug>VimwikiDiaryNextDay
nmap <leader>wk <Plug>VimwikiDiaryPrevDay

" vim-sneak
let g:sneak#label = 1

nmap <leader>S <Plug>Sneak_s

augroup vimwiki_markdown_formatting
  autocmd!
  " disable trailing spaces check in markdown and vimwiki
  autocmd FileType markdown,vimwiki let g:airline#extensions#whitespace#checks = [ 'indent' ]
  " autowrap at 79th column
  autocmd FileType markdown,vimwiki setlocal textwidth=79
  " don't leave single letter words as the last word in line when autowrapping
  autocmd FileType markdown,vimwiki setlocal formatoptions+=1
  " enable conceal in markdown-highlighted files (plasticboy/vim-markdown)
  autocmd FileType markdown setlocal conceallevel=2
augroup END

augroup latex_formatting
  autocmd!
  autocmd FileType tex setlocal formatoptions+=1
augroup END

" plasticboy/vim-markdown
let g:vim_markdown_folding_style_pythonic = 1

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

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1

" ansible
let g:ansible_unindent_after_newline = 1
let g:ansible_extra_keywords_highlight = 1
let g:ansible_normal_keywords_highlight = 'Constant'

" rust LSP
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'stable', 'rls'],
      \ }

nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" racer
let g:racer_cmd = '/home/lucas/.cargo/bin/racer'
let g:racer_experimental_completer = 1

" rust.vim
let g:rustfmt_autosave = 1

" vim-shfmt
let g:shfmt_extra_args = '-i 2 -bn -ci'

" vim-prettier
let g:prettier#autoformat = 0

let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

" pandoc
let g:pandoc#spell#default_langs = ['pl', 'en']
let g:pandoc#fomatting#textwidth = 79

" custom scripts --------------------------------------------------------------

source ~/.vim/custom/scripts/perltidy.vim

" abbreviations ---------------------------------------------------------------

source ~/.vim/custom/abbreviations.vim

" backlog functions -----------------------------------------------------------

source ~/.vim/custom/backlog.vim

" apperarance stuff -----------------------------------------------------------

" GUI font setting
if has('gui_running')
  set guifont=Iosevka\ 10
endif

" disable toolbars in GUI
set guioptions=c

" make vertical windows separator thinner
set fillchars=vert:│
highlight VertSplit ctermbg=NONE guibg=NONE

" set SignColumn color equal to general background
highlight SignColumn ctermbg=NONE guibg=NONE

" set TabLine background color equal to general background and strip underline
highlight TabLineFill ctermbg=NONE guibg=NONE
highlight BufTabLineFill ctermbg=NONE guibg=NONE

" print marker at specified column
" let &colorcolumn = '80,' . join(range(120, 999), ',')
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

" automatically equalize splits when vim is resized (say in tmux pane)
augroup autoresize_splits
  autocmd!
  autocmd VimResized * wincmd =
augroup END

" show cursorline only in active window
augroup highlight_follows_focus
  autocmd!
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END

" colorscheme settings --------------------------------------------------------

set background=dark

" true colour support
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" gruvbox settings
let g:gruvbox_color_column='bg2'
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox
" gruvbox light blue (listchars, wrapped line marks etc.)
highlight NonText guifg=#83a598

highlight ExtraWhitespace guibg=#fb4934 guifg=#fbf1c7 gui=underline
" match ExtraWhitespace /\s\+$/

source ~/.vim/custom/colors/gruvbox-terminal.vim

" folding settings ------------------------------------------------------------

" enable folding based on indentation
" set foldmethod=indent
" manual folding - testing
set foldmethod=manual
" disable automatic folding on file opening
set nofoldenable

" anyfold
let g:anyfold_activate=0

augroup anyfold_activate
  autocmd!
  autocmd FileType sh let b:anyfold_activate=1
augroup END
let g:anyfold_fold_comments=1
set foldlevel=0

highlight Folded term=NONE cterm=NONE

" -----------------------------------------------------------------------------

language en_US.utf8
