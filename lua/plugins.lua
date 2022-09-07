local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

packer.startup(function()
  local use = use

  use {'wbthomason/packer.nvim', opt = true}

  use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins'}
  use {'ms-jpq/coq_nvim', branch = 'coq', requires = {'ms-jpq/coq.artifacts', branch = 'artifacts'}, event = 'InsertEnter'}

  -- colorscheme and appearance -----------------------------------------------

  use {'npxbr/gruvbox.nvim', branch = 'main', requires = {'rktjmp/lush.nvim', branch = 'main'}}
  use {'folke/lsp-colors.nvim', branch = 'main'}
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  -- TODO: check real usability, does not seem to work with vim-go
  use {'folke/trouble.nvim', branch = 'main', requires = 'kyazdani42/nvim-web-devicons'}
  -- highlight and search for TODOs etc.
  use {'folke/todo-comments.nvim', branch = 'main', requires = 'nvim-lua/plenary.nvim'}

  use 'ntpeters/vim-better-whitespace'

  -- preview colors
  use 'norcalli/nvim-colorizer.lua'

  use 'RRethy/vim-illuminate'

  -- highlight occurences of word under cursor
  -- use {'yamatsum/nvim-cursorline', branch = 'main'}

  -- show indentation guiding lines
  use {'lukas-reineke/indent-blankline.nvim'}

  -- lsp / treesitter ---------------------------------------------------------

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig'

  -- git integration ----------------------------------------------------------

  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'
  -- show changed lines in sign column
  use 'mhinz/vim-signify'
  use 'f-person/git-blame.nvim'

  -- misc ---------------------------------------------------------------------

  use {'echasnovski/mini.nvim', branch = 'main'}
  use 'Raimondi/delimitMate'
  -- show marks in sign column
  use 'kshenoy/vim-signature'

  -- run a command only on visual selection (:B cmd)
  -- use 'vim-scripts/vis', {'frozen': 1}
  --  highlight up to 6 words when browsing code
  use 'lfv89/vim-interestingwords'
  -- change word case, advanced substitution, abbreviations
  use 'tpope/vim-abolish'
  -- disable capslock
  use 'tpope/vim-capslock'
  -- show additional info for character on ga
  use 'tpope/vim-characterize'
  -- use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-dispatch'

  -- text objects
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-entire'

  -- zeal bindings
  use 'KabbAmine/zeavim.vim'

  use 'w0rp/ale'

  -- folding ------------------------------------------------------------------

  -- custom folding formatting (indentation-based)
  use 'pseewald/vim-anyfold'
  use 'Konfekt/FastFold'
  use {'nelstrom/vim-markdown-folding', ft = 'markdown'}

  -- snippets -----------------------------------------------------------------

  use 'SirVer/UltiSnips'
  use 'honza/vim-snippets'
  use 'Trojmiasto-pl/vim-snippets-tsi'

  -- code alignment / indentation ---------------------------------------------

  use 'godlygeek/tabular'
  use 'junegunn/vim-easy-align'
  use 'tommcdo/vim-lion'

  -- navigation ---------------------------------------------------------------

  use 'tpope/vim-projectionist'
  use {'junegunn/fzf.vim', requires = {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }}
  -- create missing dirs automatically on write
  use 'duggiefresh/vim-easydir'
  use 'nanotee/zoxide.vim'
  use {'mhinz/vim-sayonara', cmd = 'Sayonara'}
  use 'christoomey/vim-tmux-navigator'
  use 'justinmk/vim-dirvish'

  use 'justinmk/vim-sneak'

  -- use 'machakann/vim-sandwich'
  --
  use {
     'goolord/alpha-nvim',
     requires = { 'kyazdani42/nvim-web-devicons' },
     config = function ()
         require'alpha'.setup(require'alpha.themes.startify'.config)
     end
  }
  use 'machakann/vim-swap'

  -- search -------------------------------------------------------------------

  -- use * in visual mode
  use 'nelstrom/vim-visual-star-search'
  -- show register contents on ctrl-r
  use 'junegunn/vim-peekaboo'
  -- show number of search results found
  -- use 'henrik/vim-indexed-search'
  use 'mhinz/vim-grepper'

  -- syntax files --------------------------------------------------------------

  use 'pearofducks/ansible-vim'
  use 'PotatoesMaster/i3-vim-syntax'
  use {'derekwyatt/vim-scala',              ft = 'scala'}
  use {'chr4/nginx.vim',                    ft = 'nginx'}
  use {'mitsuhiko/vim-jinja',               ft = 'jinja'}
  use {'slim-template/vim-slim',            ft = 'slim'}
  use {'rust-lang/rust.vim',                ft = 'rust'}
  use {'ekalinin/Dockerfile.vim',           ft = 'Dockerfile'}
  use {'vim-scripts/ferm.vim',              ft = 'ferm'}
  use {'rodjek/vim-puppet',                 ft = 'puppet'}
  use {'Matt-Deacalion/vim-systemd-syntax', ft = 'systemd'}
  use {'hdima/python-syntax',               ft = 'python'}
  use {'plasticboy/vim-markdown',           ft = 'markdown'}
  use {'davinche/godown-vim',               ft = 'markdown'}
  use {'moon-musick/vim-logrotate',         ft = 'logrotate'}
  use {'cespare/vim-toml',                  ft = 'toml'}
  use {'glidenote/keepalived-syntax.vim',   ft = 'keepalived'}
  use {'tmux-plugins/vim-tmux',             ft = 'tmux'}

  -- filetype-related tools ------------------------------------------------------

  use {'psf/black',                   ft = 'python'}
  use {'vim-ruby/vim-ruby',           ft = 'ruby'}
  -- use {'fatih/vim-go',                ft = {'go', 'gotexttmpl', 'markdown', 'vimwiki'}, run = ':GoUpdateBinaries'}
  use {'ray-x/go.nvim'}
  use {'chrisbra/csv.vim',            ft = 'csv'}
  -- use {'racer-rust/vim-racer',        ft = 'rust'}
  -- use {'bitc/vim-hdevtools',          ft = 'haskell'}
  -- use {'eagletmt/neco-ghc',           ft = 'haskell'}
  use {'neovimhaskell/haskell-vim',   ft = 'haskell'}
  -- use {'ndmitchell/ghcid',            'rtp': 'plugins/nvim'}
  use {'lervag/vimtex',               ft = 'tex'}
  -- use {'rust-lang/rust.vim',          ft = 'rust', as = 'rust-lang.vim'}
  use {'vimoutliner/vimoutliner',     ft = 'votl'}
  -- use 'vimwiki/vimwiki'
  use {'ledger/vim-ledger',           ft = 'ledger'}
  use {'fgsch/vim-varnish',           ft = 'vcl'}
  use {'z0mbix/vim-shfmt',            ft = {'sh', 'bash'}}
  use 'vim-pandoc/vim-pandoc'
  use 'vim-pandoc/vim-pandoc-syntax'
  use {'prettier/vim-prettier', run = 'npm install', ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'}}
  use 'ron-rs/ron.vim'
  use 'robbles/logstash.vim'
  end
)

-------------------------------------------------------------------------------

vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])
-- must be invoked after 'set termguicolors'
if jit ~= nil then
  require'colorizer'.setup()
end

-------------------------------------------------------------------------------

require("nvim-web-devicons").setup { default = true }
require("trouble").setup {}

-- https://github.com/folke/todo-comments.nvim/issues/97
local hl = require("todo-comments.highlight")
local highlight_win = hl.highlight_win
hl.highlight_win = function(win, force)
  pcall(highlight_win, win, force)
end
require("todo-comments").setup()

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
require('gruvbox').setup({ italic = false })

local lsp = require('lspconfig')
-- local coq = require('coq')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- local util = require('lspconfig.util')
lsp.gopls.setup({
  -- coq.lsp_ensure_capabilities(
  -- {
  --   cmd = {'gopls'},
  --   filetypes = {'go', 'gomod', 'gowork', 'gotmpl'},
  --   root_dir = util.root_pattern('go.mod', '.git'),
  --   single_file_support = true
  -- }
    on_attach = on_attach,
    flags = lsp_flags,
  }
)
-- ))
require('go').setup()
require('go.format').goimport()
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport()  ]], false)
