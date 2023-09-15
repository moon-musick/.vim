-- standard lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

--
-- suggested by the lazy.nvim author
vim.g.mapleader = " "

require("lazy").setup({
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  "simrat39/inlay-hints.nvim",
  "simrat39/rust-tools.nvim",

  "neovim/nvim-lspconfig",
  {"Shougo/deoplete.nvim", build = ":UpdateRemotePlugins"},

  {"npxbr/gruvbox.nvim", branch = "main", dependencies = {"rktjmp/lush.nvim", branch = "main"}},
  "Shatur/neovim-ayu",
  {"folke/lsp-colors.nvim", branch = "main"},
  "Tsuzat/NeoSolarized.nvim",
  {"projekt0n/github-nvim-theme", branch = "main"},
  "nvim-lualine/lualine.nvim",
  -- TODO: check real usability, does not seem to work with vim-go
  {"folke/trouble.nvim", branch = "main", dependencies = "nvim-tree/nvim-web-devicons"},
  -- highlight and search for TODOs etc.
  {"folke/todo-comments.nvim", branch = "main", dependencies = "nvim-lua/plenary.nvim"},

  "ntpeters/vim-better-whitespace",

  -- preview colors
  "norcalli/nvim-colorizer.lua",

  -- check for bugs
  -- "RRethy/vim-illuminate",

  -- highlight occurences of word under cursor
  {"yamatsum/nvim-cursorline", branch = "main"},

  -- show indentation guiding lines
  "lukas-reineke/indent-blankline.nvim",

  -- lsp / treesitter ---------------------------------------------------------

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- git integration ----------------------------------------------------------

  "tpope/vim-fugitive",
  "junegunn/gv.vim",
  -- show changed lines in sign column
  "mhinz/vim-signify",
  "f-person/git-blame.nvim",

  {"sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim"},

  -- misc ---------------------------------------------------------------------

  {"echasnovski/mini.nvim", branch = "main"},
  "Raimondi/delimitMate",
  -- show marks in sign column
  "kshenoy/vim-signature",

  -- run a command only on visual selection (:B cmd)
  -- use "vim-scripts/vis", {"frozen": 1}
  --  highlight up to 6 words when browsing code
  "lfv89/vim-interestingwords",
  -- change word case, advanced substitution, abbreviations
  "tpope/vim-abolish",
  -- disable capslock
  "tpope/vim-capslock",
  -- show additional info for character on ga
  "tpope/vim-characterize",
  -- use "tpope/vim-commentary"
  "tpope/vim-eunuch",
  "tpope/vim-repeat",
  "tpope/vim-unimpaired",
  "tpope/vim-dispatch",

  -- text objects
  "kana/vim-textobj-user",
  -- "kana/vim-textobj-entire",

  -- zeal bindings
  "KabbAmine/zeavim.vim",

  "w0rp/ale",

  -- folding ------------------------------------------------------------------

  -- custom folding formatting (indentation-based)
  "pseewald/vim-anyfold",
  "Konfekt/FastFold",
  {"nelstrom/vim-markdown-folding", ft = "markdown"},

  -- snippets -----------------------------------------------------------------

  "SirVer/UltiSnips",
  "honza/vim-snippets",
  "Trojmiasto-pl/vim-snippets-tsi",

  -- code alignment / indentation ---------------------------------------------

  "godlygeek/tabular",
  "junegunn/vim-easy-align",
  "tommcdo/vim-lion",

  -- navigation ---------------------------------------------------------------

  "tpope/vim-projectionist",
  {"junegunn/fzf.vim", dependencies = {"junegunn/fzf", dir = "~/.fzf", build = "./install --all" }},
  -- create missing dirs automatically on write
  "duggiefresh/vim-easydir",
  "nanotee/zoxide.vim",
  {"mhinz/vim-sayonara", cmd = "Sayonara"},
  "christoomey/vim-tmux-navigator",
  "justinmk/vim-dirvish",

  "justinmk/vim-sneak",

  -- use "machakann/vim-sandwich"
  "machakann/vim-swap",

  -- search -------------------------------------------------------------------

  -- use * in visual mode
  "nelstrom/vim-visual-star-search",
  -- show register contents on ctrl-r
  "junegunn/vim-peekaboo",
  -- show number of search results found
  -- use "henrik/vim-indexed-search"
  "mhinz/vim-grepper",

  -- syntax files --------------------------------------------------------------

  "pearofducks/ansible-vim",
  "PotatoesMaster/i3-vim-syntax",
  {"chr4/nginx.vim",                    ft = "nginx"},
  {"mitsuhiko/vim-jinja",               ft = "jinja"},
  {"slim-template/vim-slim",            ft = "slim"},
  {"rust-lang/rust.vim",                ft = "rust"},
  {"ekalinin/Dockerfile.vim",           ft = "Dockerfile"},
  {"Matt-Deacalion/vim-systemd-syntax", ft = "systemd"},
  {"hdima/python-syntax",               ft = "python"},
  {"plasticboy/vim-markdown",           ft = "markdown"},
  {"davinche/godown-vim",               ft = "markdown"},
  {"moon-musick/vim-logrotate",         ft = "logrotate"},
  {"cespare/vim-toml",                  ft = "toml"},
  {"glidenote/keepalived-syntax.vim",   ft = "keepalived"},
  {"tmux-plugins/vim-tmux",             ft = "tmux"},
  "NoahTheDuke/vim-just",
  "IndianBoy42/tree-sitter-just",

  -- filetype-related tools ------------------------------------------------------

  {"vim-ruby/vim-ruby",           ft = "ruby"},
  -- use {"fatih/vim-go",                ft = {"go", "gotexttmpl", "markdown", "vimwiki"}, build = ":GoUpdateBinaries"},
  {"ray-x/go.nvim", dependencies = {"ray-x/guihua.lua"}},
  {"chrisbra/csv.vim",            ft = "csv"},
  -- use {"racer-rust/vim-racer",        ft = "rust"},
  -- use {"bitc/vim-hdevtools",          ft = "haskell"},
  -- use {"eagletmt/neco-ghc",           ft = "haskell"},
  {"neovimhaskell/haskell-vim",   ft = "haskell"},
  -- use {"ndmitchell/ghcid",            "rtp": "plugins/nvim"},
  {"lervag/vimtex",               ft = "tex"},
  -- use {"rust-lang/rust.vim",          ft = "rust", as = "rust-lang.vim"},
  {"vimoutliner/vimoutliner",     ft = "votl"},
  -- use "vimwiki/vimwiki"
  {"ledger/vim-ledger",           ft = "ledger"},
  {"fgsch/vim-varnish",           ft = "vcl"},
  {"z0mbix/vim-shfmt",            ft = {"sh", "bash"}},
  "vim-pandoc/vim-pandoc",
  "vim-pandoc/vim-pandoc-syntax",
  {"prettier/vim-prettier", build = "npm install", ft = {"javascript", "typescript", "css", "less", "scss", "json", "graphql", "markdown", "vue", "yaml", "html"}},
  "ron-rs/ron.vim",
  "robbles/logstash.vim",
})

-------------------------------------------------------------------------------

-- must be invoked after 'set termguicolors'
if jit ~= nil then
  require'colorizer'.setup()
end

-------------------------------------------------------------------------------

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'rust_analyzer',
    'gopls',
    'ruff_lsp',
  }
})

require('inlay-hints').setup({
  only_current_line = true,

  -- eol = {
  --   right_align = true,
  -- },
})
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
require('gruvbox').setup({
  italic = {
    strings = false,
    operators = false,
    comments = true,
  }
})

require('ayu').setup({})

-------------------------------------------------------------------------------

local lsp = require('lspconfig')
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

lsp.gopls.setup({
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

lsp.ruff_lsp.setup({
  on_attach = on_attach,
  flags = lsp_flags,
})

local rt = require('rust-tools')
rt.setup({
  server = {
    on_attach = on_attach,
  }
})

require('go').setup()
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport()  ]], false)

require("NeoSolarized.config").setup({
  style = "dark",
  transparent = false,
  enable_italics = false,
})

-- require('lspconfig').unison.setup({})
require('tree-sitter-just').setup({})
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = '｜',
    section_separators = '',
  }
})
