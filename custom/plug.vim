" required setting for most plugins
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer' }

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-projectionist'
Plug 'mbbill/undotree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }
"
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-lion'

Plug 'henrik/vim-indexed-search'
Plug 'Raimondi/delimitMate'
Plug 'kshenoy/vim-signature'
Plug 'Yggdroot/indentLine'
Plug 'nelstrom/vim-visual-star-search'
Plug 'lfv89/vim-interestingwords'
Plug 'junegunn/vim-peekaboo'

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'

Plug 'ap/vim-buftabline'

Plug 'duggiefresh/vim-easydir'

Plug 'mhinz/vim-grepper'

Plug 'KabbAmine/zeavim.vim'

Plug 'scrooloose/syntastic'

Plug 'SirVer/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'Trojmiasto-pl/vim-snippets-tsi'

Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'

" syntax files
Plug 'derekwyatt/vim-scala',        {'for': 'scala'}
Plug 'evanmiller/nginx-vim-syntax', {'for': 'nginx'}
Plug 'pearofducks/ansible-vim',     {'for': 'ansible'}
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

" filetype-related tools
Plug 'vim-ruby/vim-ruby',           {'for': 'ruby'}
Plug 'tpope/vim-rbenv',             {'for': 'ruby'}
Plug 'tpope/vim-cucumber'
Plug 'fatih/vim-go',                {'for': 'go'}
Plug 'chrisbra/csv.vim',            {'for': 'csv'}
Plug 'bitc/vim-hdevtools',          {'for': 'haskell'}
Plug 'eagletmt/neco-ghc',           {'for': 'haskell'}
Plug 'neovimhaskell/haskell-vim',   {'for': 'haskell'}
Plug 'klen/python-mode',            {'for': 'python'}
Plug 'lervag/vimtex',               {'for': 'tex'}
Plug 'rust-lang/rust.vim',          {'for': 'rust', 'dir': '~/.vim/plugged/rust-lang.vim'}
Plug 'vimoutliner/vimoutliner',     {'for': 'votl'}

call plug#end()

filetype plugin indent on
