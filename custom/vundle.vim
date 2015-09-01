" Vundle ----------------------------------------------------------------------

" required setting for most plugins
set nocompatible
" turn off filetype detection for Vundle call
filetype off
" add Vundle to runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" list all plugins to be managed by Vundle

" completion
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'

" appearance
Plugin 'altercation/vim-colors-solarized'

" navigation & finders
Plugin 'kien/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'scrooloose/nerdtree'

" tag browsing
Plugin 'majutsushi/tagbar'

" auto-alignment
Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'

" undo
Plugin 'sjl/gundo.vim'

" miscellaneous internal tools
Plugin 'Lokaltog/vim-easymotion'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'henrik/vim-indexed-search'
Plugin 'Raimondi/delimitMate'
Plugin 'kana/vim-textobj-lastpat'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-capslock'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'wellle/targets.vim'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'glts/vim-textobj-comment'
Plugin 'kana/vim-textobj-indent'

" external tools
Plugin 'mileszs/ack.vim'
Plugin 'xaviershay/tslime.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'duggiefresh/vim-easydir'

" syntax checking and linting
Plugin 'scrooloose/syntastic'

" code snippets
Plugin 'SirVer/UltiSnips'
Plugin 'honza/vim-snippets'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'int3/vim-extradite'

" syntax files
Plugin 'derekwyatt/vim-scala'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'chase/vim-ansible-yaml'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'tangledhelix/vim-kickstart'
Plugin 'slim-template/vim-slim'
Plugin 'wting/rust.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'vim-scripts/ferm.vim'

" filetype-related tools
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fireplace'
Plugin 'fatih/vim-go'
Plugin 'chrisbra/csv.vim'
Plugin 'farseer90718/vim-taskwarrior'
Plugin 'bitc/hdevtools'
Plugin 'eagletmt/neco-ghc'

call vundle#end()
" required by Vundle and useful otherwise
filetype plugin indent on
