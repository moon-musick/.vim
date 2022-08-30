" required setting for most plugins
set nocompatible

call plug#begin('~/.vim/plugged')

" neovim only -----------------------------------------------------------------
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  " pythnon 3.8.2 needed
  " Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  " Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

  " colorscheme ---------------------------------------------------------------
  Plug 'rktjmp/lush.nvim', {'branch': 'main'} | Plug 'npxbr/gruvbox.nvim', {'branch': 'main'}
  Plug 'folke/lsp-colors.nvim', {'branch': 'main'}
  Plug 'EdenEast/nightfox.nvim', {'branch': 'main'}
  Plug 'shaunsingh/nord.nvim'

  " view warnings & errors etc. -----------------------------------------------
  " TODO: check actual usability, does not seem to work with vim-go
  Plug 'kyazdani42/nvim-web-devicons' | Plug 'folke/trouble.nvim', {'branch': 'main'}
  " highlight and search for TODOs etc.
  Plug 'nvim-lua/plenary.nvim' | Plug 'folke/todo-comments.nvim', {'branch': 'main'}

  " preview colors ------------------------------------------------------------
  Plug 'norcalli/nvim-colorizer.lua'

  " highlight occurences of word under cursor ---------------------------------
  " Plug 'yamatsum/nvim-cursorline', {'branch': 'main'}

  " highlight ranges in cmd line (e.g. :15,20) --------------------------------
  " Plug 'winston0410/cmd-parser.nvim' | Plug 'winston0410/range-highlight.nvim'

  " show indentation guiding lines --------------------------------------------
  Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}

  " lsp / treesitter ----------------------------------------------------------
  Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'

  " navigation ----------------------------------------------------------------
  " conflicts with vim-sandwich
  " Plug 'ggandor/lightspeed.nvim', {'branch': 'main'}

  " git integration -----------------------------------------------------------
  Plug 'f-person/git-blame.nvim'

  " general stuff -------------------------------------------------------------
  Plug 'echasnovski/mini.nvim', {'branch': 'master'}

endif

Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}

" colorschemes ----------------------------------------------------------------
" Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rebelot/kanagawa.nvim'

" visual stuff ----------------------------------------------------------------
Plug 'ntpeters/vim-better-whitespace'

" Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

" navigation ------------------------------------------------------------------
Plug 'tpope/vim-projectionist'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
" create missing dirs automatically on write
Plug 'duggiefresh/vim-easydir'
Plug 'nanotee/zoxide.vim'

" Plug 'wellle/visual-split.vim'

Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}

Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-dirvish'

" code aligment ---------------------------------------------------------------
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-lion'

" movements & operators -------------------------------------------------------
Plug 'justinmk/vim-sneak'

" Plug 'machakann/vim-sandwich'
Plug 'machakann/vim-swap'

" search ----------------------------------------------------------------------
" use * in visual mode
Plug 'nelstrom/vim-visual-star-search'
" show register contents on ctrl-r
Plug 'junegunn/vim-peekaboo'
" show number of search results found
" Plug 'henrik/vim-indexed-search'
Plug 'mhinz/vim-grepper'

" misc ------------------------------------------------------------------------
" run a command only on visual selection (:B cmd)
Plug 'vim-scripts/vis', {'frozen': 1}
" autocomplete brackets etc.
Plug 'Raimondi/delimitMate'
" show marks in sign column
Plug 'kshenoy/vim-signature'
" highlight up to 6 words when browsing code
Plug 'lfv89/vim-interestingwords'

" change word case, advanced substitution, abbreviations
Plug 'tpope/vim-abolish'
" disable capslock
Plug 'tpope/vim-capslock'
" show additional info for character on ga
Plug 'tpope/vim-characterize'
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'

" text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

" zeal bindings
Plug 'KabbAmine/zeavim.vim'

Plug 'w0rp/ale'

" folding ---------------------------------------------------------------------
" custom folding formatting (indentation-based)
Plug 'pseewald/vim-anyfold'
Plug 'Konfekt/FastFold'
Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}

" snippets --------------------------------------------------------------------
Plug 'SirVer/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'Trojmiasto-pl/vim-snippets-tsi'

" git integration -------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" show changed lines in sign column
Plug 'mhinz/vim-signify'

" syntax files ----------------------------------------------------------------
Plug 'derekwyatt/vim-scala',        {'for': 'scala'}
Plug 'chr4/nginx.vim',              {'for': 'nginx'}
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
" Plug 'tpope/vim-markdown',          {'for': 'markdown'}
Plug 'davinche/godown-vim',         {'for': 'markdown'}
Plug 'moon-musick/vim-logrotate',   {'for': 'logrotate'}
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'cespare/vim-toml',            {'for': 'toml'}
Plug 'glidenote/keepalived-syntax.vim', {'for': 'keepalived'}
Plug 'tmux-plugins/vim-tmux',       {'for': 'tmux'}

" filetype-related tools ------------------------------------------------------
Plug 'psf/black',                   {'for': 'python'}
Plug 'vim-ruby/vim-ruby',           {'for': 'ruby'}
Plug 'fatih/vim-go',                {'for': ['go', 'gotexttmpl', 'markdown', 'vimwiki'], 'do': ':GoUpdateBinaries'}
Plug 'chrisbra/csv.vim',            {'for': 'csv'}
" Plug 'racer-rust/vim-racer',        {'for': 'rust'}
" Plug 'bitc/vim-hdevtools',          {'for': 'haskell'}
" Plug 'eagletmt/neco-ghc',           {'for': 'haskell'}
Plug 'neovimhaskell/haskell-vim',   {'for': 'haskell'}
" Plug 'ndmitchell/ghcid',            {'rtp': 'plugins/nvim'}
Plug 'lervag/vimtex',               {'for': 'tex'}
" Plug 'rust-lang/rust.vim',          {'for': 'rust', 'dir': '~/.vim/plugged/rust-lang.vim'}
Plug 'vimoutliner/vimoutliner',     {'for': 'votl'}
" Plug 'vimwiki/vimwiki'
Plug 'ledger/vim-ledger',           {'for': 'ledger'}
Plug 'fgsch/vim-varnish',           {'for': 'vcl'}
Plug 'z0mbix/vim-shfmt',            {'for': ['sh', 'bash']}
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'ron-rs/ron.vim'
Plug 'robbles/logstash.vim'

call plug#end()

filetype plugin indent on

if has('nvim')
lua << EOF
require("nvim-web-devicons").setup {
  default = true
}
require("trouble").setup {}
require("todo-comments").setup {}
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        ["ak"] = "@call.outer",
        ["ik"] = "@call.inner",

        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",

        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",

        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",

        ["ad"] = "@parameter.outer",
        ["id"] = "@parameter.inner",

        ["aC"] = "@comment.outer",

        -- Or you can define your own textobjects like this
        -- ["iF"] = {
          -- python = "(function_definition) @function",
          -- cpp = "(function_definition) @function",
          -- c = "(function_definition) @function",
          -- java = "(method_declaration) @function",
        -- },
      },
    },
  },
}
require('mini.surround').setup()
require('mini.comment').setup()

--  require('range-highlight').setup{}
EOF
endif
