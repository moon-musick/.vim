" required setting for most plugins
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --gocode-completer' }

Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/seoul256.vim'

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-projectionist'
Plug 'mbbill/undotree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }
"
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-lion'

" show number of search results found
Plug 'henrik/vim-indexed-search'
Plug 'Raimondi/delimitMate'
" show marks in sign column
Plug 'kshenoy/vim-signature'
" show indentation guiding lines
Plug 'Yggdroot/indentLine'
" use * in visual mode
Plug 'nelstrom/vim-visual-star-search'
" highlight up to 6 words when browsing code
Plug 'lfv89/vim-interestingwords'
" show register contents on ctrl-r
Plug 'junegunn/vim-peekaboo'
" Plug 'junegunn/vim-slash'

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-capslock'
" show additional info for character on ga
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'

" custom folding formatting (indentation-based)
Plug 'pseewald/vim-anyfold'

" flash yanked region / object
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'

" show buffers instead of tabs in tabline
Plug 'ap/vim-buftabline'

" create missing dirs automatically on write
Plug 'duggiefresh/vim-easydir'

Plug 'mhinz/vim-grepper'

" cp cP cv - copy and paste from system clipboard
Plug 'christoomey/vim-system-copy'

" find and replace - project-wide replace
Plug 'brooth/far.vim'

" zeal bindings
Plug 'KabbAmine/zeavim.vim'

" show diffs of dirs
Plug 'will133/vim-dirdiff'

Plug 'scrooloose/syntastic'

Plug 'SirVer/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'Trojmiasto-pl/vim-snippets-tsi'

Plug 'tpope/vim-fugitive'
" git visualisation stuff
Plug 'junegunn/gv.vim'
" show changed lines in sign column
Plug 'mhinz/vim-signify'
" multiple buffer setup for git commit messages
Plug 'rhysd/committia.vim'

" syntax files
Plug 'derekwyatt/vim-scala',        {'for': 'scala'}
Plug 'evanmiller/nginx-vim-syntax', {'for': 'nginx'}
Plug 'pearofducks/ansible-vim'
Plug 'mitsuhiko/vim-jinja',         {'for': 'jinja'}
Plug 'tangledhelix/vim-kickstart',  {'for': 'kickstart'}
Plug 'slim-template/vim-slim',      {'for': 'slim'}
Plug 'wting/rust.vim'
Plug 'ekalinin/Dockerfile.vim',     {'for': 'Dockerfile'}
Plug 'vim-scripts/ferm.vim',        {'for': 'ferm'}
Plug 'rodjek/vim-puppet',           {'for': 'puppet'}
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'hdima/python-syntax',         {'for': 'python'}
Plug 'plasticboy/vim-markdown',     {'for': 'markdown'}
Plug 'davinche/godown-vim',         {'for': 'markdown'}
Plug 'moon-musick/vim-logrotate',   {'for': 'logrotate'}
Plug 'moon-musick/vim-i3-config-syntax', {'for': 'i3'}
Plug 'cespare/vim-toml',            {'for': 'toml'}
Plug 'glidenote/keepalived-syntax.vim'
Plug 'b4b4r07/vim-hcl'
Plug 'eiginn/iptables-vim'
Plug 'ClockworkNet/vim-bacula', {'for': 'bacula'}

" filetype-related tools
Plug 'vim-ruby/vim-ruby',           {'for': 'ruby'}
Plug 'tpope/vim-rbenv',             {'for': 'ruby'}
Plug 'tpope/vim-cucumber'
Plug 'fatih/vim-go',                {'for': ['go', 'gotexttmpl']}
Plug 'chrisbra/csv.vim',            {'for': 'csv'}
Plug 'bitc/vim-hdevtools',          {'for': 'haskell'}
Plug 'eagletmt/neco-ghc',           {'for': 'haskell'}
Plug 'neovimhaskell/haskell-vim',   {'for': 'haskell'}
" Plug 'klen/python-mode',            {'for': 'python'}
Plug 'lervag/vimtex',               {'for': 'tex'}
Plug 'rust-lang/rust.vim',          {'for': 'rust', 'dir': '~/.vim/plugged/rust-lang.vim'}
Plug 'vimoutliner/vimoutliner',     {'for': 'votl'}
Plug 'fatih/vim-hclfmt'

call plug#end()

filetype plugin indent on
