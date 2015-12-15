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
Plug 'sjl/gundo.vim'

" miscellaneous internal tools
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'henrik/vim-indexed-search'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kshenoy/vim-signature'
Plug 'nathanaelkane/vim-indent-guides'
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

" textobj plugins
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'bps/vim-textobj-python'

" external tools
Plug 'mileszs/ack.vim'
Plug 'xaviershay/tslime.vim'
Plug 'thinca/vim-quickrun'
Plug 'duggiefresh/vim-easydir'

" syntax checking and linting
Plug 'scrooloose/syntastic'

" code snippets
Plug 'SirVer/UltiSnips'
Plug 'honza/vim-snippets'

" git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'int3/vim-extradite'

" syntax files
Plug 'derekwyatt/vim-scala'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'chase/vim-ansible-yaml'
Plug 'mitsuhiko/vim-jinja'
Plug 'tangledhelix/vim-kickstart'
Plug 'slim-template/vim-slim'
Plug 'wting/rust.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-scripts/ferm.vim'
Plug 'rodjek/vim-puppet'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'hdima/python-syntax'

" filetype-related tools
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-fireplace'
Plug 'fatih/vim-go'
Plug 'chrisbra/csv.vim'
Plug 'farseer90718/vim-taskwarrior'
Plug 'bitc/hdevtools'
Plug 'eagletmt/neco-ghc'

" outliner
Plug 'vimoutliner/vimoutliner'

call plug#end()

filetype plugin indent on
