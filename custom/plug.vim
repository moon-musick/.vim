" required setting for most plugins
set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab'
Plug 'maralla/completor.vim'

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-projectionist'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-lion'

Plug 'wellle/visual-split.vim'

Plug 'justinmk/vim-sneak'

Plug 'machakann/vim-sandwich'
Plug 'machakann/vim-swap'

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

Plug 'mhinz/vim-sayonara'

" custom folding formatting (indentation-based)
Plug 'pseewald/vim-anyfold'
Plug 'Konfekt/FastFold'
Plug 'nelstrom/vim-markdown-folding'

" create missing dirs automatically on write
Plug 'duggiefresh/vim-easydir'

Plug 'mhinz/vim-grepper'

" cp cP cv - copy and paste from system clipboard
Plug 'christoomey/vim-system-copy'

" zeal bindings
Plug 'KabbAmine/zeavim.vim'

Plug 'w0rp/ale'

Plug 'SirVer/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'Trojmiasto-pl/vim-snippets-tsi'

Plug 'tpope/vim-fugitive'
" show changed lines in sign column
Plug 'mhinz/vim-signify'

Plug 'dhruvasagar/vim-table-mode'

Plug 'christoomey/vim-tmux-navigator'

" syntax files
Plug 'derekwyatt/vim-scala',        {'for': 'scala'}
Plug 'evanmiller/nginx-vim-syntax', {'for': 'nginx'}
Plug 'pearofducks/ansible-vim'
Plug 'mitsuhiko/vim-jinja',         {'for': 'jinja'}
Plug 'tangledhelix/vim-kickstart',  {'for': 'kickstart'}
Plug 'slim-template/vim-slim',      {'for': 'slim'}
Plug 'rust-lang/rust.vim',          {'for': 'rust'}
Plug 'ekalinin/Dockerfile.vim',     {'for': 'Dockerfile'}
Plug 'vim-scripts/ferm.vim',        {'for': 'ferm'}
Plug 'rodjek/vim-puppet',           {'for': 'puppet'}
Plug 'Matt-Deacalion/vim-systemd-syntax', {'for': 'systemd'}
Plug 'hdima/python-syntax',         {'for': 'python'}
Plug 'plasticboy/vim-markdown',     {'for': 'markdown'}
" Plug 'tpope/vim-markdown',     {'for': 'markdown'}
Plug 'davinche/godown-vim',         {'for': 'markdown'}
Plug 'moon-musick/vim-logrotate',   {'for': 'logrotate'}
Plug 'moon-musick/vim-i3-config-syntax', {'for': 'i3'}
Plug 'cespare/vim-toml',            {'for': 'toml'}
Plug 'glidenote/keepalived-syntax.vim'
Plug 'b4b4r07/vim-hcl'
Plug 'ClockworkNet/vim-bacula', {'for': 'bacula'}

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

" filetype-related tools
Plug 'vim-ruby/vim-ruby',           {'for': 'ruby'}
Plug 'fatih/vim-go',                {'for': ['go', 'gotexttmpl', 'markdown', 'vimwiki'], 'do': ':GoInstallBinaries'}
Plug 'chrisbra/csv.vim',            {'for': 'csv'}
" Plug 'bitc/vim-hdevtools',          {'for': 'haskell'}
" Plug 'eagletmt/neco-ghc',           {'for': 'haskell'}
" Plug 'neovimhaskell/haskell-vim',   {'for': 'haskell'}
" Plug 'klen/python-mode',            {'for': 'python'}
Plug 'lervag/vimtex',               {'for': 'tex'}
Plug 'rust-lang/rust.vim',          {'for': 'rust', 'dir': '~/.vim/plugged/rust-lang.vim'}
Plug 'vimoutliner/vimoutliner',     {'for': 'votl'}
Plug 'fatih/vim-hclfmt'
Plug 'vimwiki/vimwiki'
Plug 'ledger/vim-ledger'

Plug 'mtth/scratch.vim'

call plug#end()

filetype plugin indent on
