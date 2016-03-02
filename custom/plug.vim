" Plug ------------------------------------------------------------------------

" required setting for most plugins
set nocompatible

call plug#begin('~/.vim/plugged')

" list all plugins to be managed by Plug

" completion
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

" appearance
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'zeis/vim-kolor'

" navigation & finders
Plug 'kien/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-vinegar'

" tag browsing
Plug 'majutsushi/tagbar'

" auto-alignment
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'

" undo
Plug 'mbbill/undotree'

" miscellaneous internal tools
Plug 'easymotion/vim-easymotion'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'henrik/vim-indexed-search'
Plug 'Raimondi/delimitMate'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kshenoy/vim-signature'
Plug 'Yggdroot/indentLine'
Plug 'nelstrom/vim-visual-star-search'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'Konfekt/FastFold'
Plug 'mhinz/vim-grepper'
Plug 'airblade/vim-rooter'

" textobj plugins
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-fold'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'nelstrom/vim-textobj-rubyblock',  {'for': 'ruby'}
Plug 'bps/vim-textobj-python',          {'for': 'python'}
Plug 'beloglazov/vim-textobj-quotes'

" external tools
Plug 'mileszs/ack.vim'
Plug 'xaviershay/tslime.vim'
Plug 'jebaum/vim-tmuxify'
Plug 'thinca/vim-quickrun'
Plug 'duggiefresh/vim-easydir'

" syntax checking and linting
Plug 'scrooloose/syntastic'

" code snippets
Plug 'SirVer/UltiSnips'
Plug 'honza/vim-snippets'

" git
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'gregsexton/gitv'
Plug 'int3/vim-extradite'
Plug 'airblade/vim-gitgutter'

" syntax files
Plug 'derekwyatt/vim-scala',        {'for': 'scala'}
Plug 'evanmiller/nginx-vim-syntax', {'for': 'nginx'}
Plug 'chase/vim-ansible-yaml',      {'for': 'ansible'}
Plug 'mitsuhiko/vim-jinja',         {'for': 'jinja'}
Plug 'tangledhelix/vim-kickstart',  {'for': 'kickstart'}
Plug 'slim-template/vim-slim',      {'for': 'slim'}
Plug 'wting/rust.vim',              {'for': 'rust'}
Plug 'ekalinin/Dockerfile.vim',     {'for': 'Dockerfile'}
Plug 'vim-scripts/ferm.vim',        {'for': 'ferm'}
Plug 'rodjek/vim-puppet',           {'for': 'puppet'}
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'hdima/python-syntax',         {'for': 'python'}

" filetype-related tools
Plug 'vim-ruby/vim-ruby',           {'for': 'ruby'}
Plug 'tpope/vim-rbenv',             {'for': 'ruby'}
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-fireplace',         {'for': 'clojure'}
Plug 'fatih/vim-go',                {'for': 'go'}
Plug 'chrisbra/csv.vim',            {'for': 'csv'}
Plug 'bitc/hdevtools',              {'for': 'haskell'}
Plug 'eagletmt/neco-ghc',           {'for': 'haskell'}
Plug 'tweekmonster/braceless.vim'

" outliner
Plug 'vimoutliner/vimoutliner',     {'for': 'votl'}
Plug 'xolox/vim-misc' | Plug 'xolox/vim-notes'

call plug#end()

filetype plugin indent on
