-- Plug setup -----------------------------------------------------------------

-- use lua-only filetype detection
-- not sure if needs to be called before vim-plug
-- vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 0

vim.opt.termguicolors = true

-- plugins installed in separate file to facilitate unattented installation
require('plugins')

-- helpers --------------------------------------------------------------------

function nvim_create_augroups(definitions)
  local execute = vim.api.nvim_command

  for group_name, definition in pairs(definitions) do
    execute('augroup ' .. group_name)
    execute('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      execute(command)
    end
    execute('augroup END')
  end
end

local function map_key(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

-- indentation and syntax options ---------------------------------------------

vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.matchpairs = vim.opt.matchpairs + '<:>'
-- show matching brace for 0.2 seconds
vim.opt.matchtime = 2
-- enable backspace over newlines, inserted chars and autoindent in insert mode
vim.opt.backspace = "start,eol,indent"

vim.opt.wrap = false
-- preserve indentation when visually wrapping lines
vim.opt.breakindent = true
-- mark wrapped lines with this string
vim.opt.showbreak = '+ '
-- disable syntax highlighting for very long lines
vim.opt.synmaxcol = 512
-- disable joining lines with two spaces after a period sign
vim.opt.joinspaces = false
vim.opt.lazyredraw = true
-- set characters for whitespace display
vim.opt.listchars = 'tab:» ,eol:¬'

-- search options -------------------------------------------------------------

vim.opt.ignorecase = true
vim.opt.smartcase = true
-- enable hidden buffers (switch to other buffer without saving first)
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- interactive replacement preview with :substitute
vim.opt.inccommand = 'nosplit'

-- filetype-related stuff -----------------------------------------------------

local ft_autocmds = {
  indentation_settings = {
    {'FileType', 'python,haskell,markdown', 'setlocal expandtab   tabstop=4 shiftwidth=4 softtabstop=4 autoindent'},
    {'FileType', 'lokis',                   'setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8'},
    {'FileType', 'go',                      'setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent'},
    {'FileType', 'votl',                    'setlocal softtabstop=4'},
  },
  filetype_settings = {
    {'BufRead,BufNewFile', '*.rsc',  'set filetype=rsc'},
    {'BufRead,BufNewFile', '*.ks',   'set filetype=kickstart'},
    {'BufRead,BufNewFile', '*.html', 'set filetype=html'},
    {'BufRead,BufNewFile', '*.css',  'set filetype=css'},
    {'BufRead,BufNewFile', '*.j2',   'set filetype=jinja'},
    {'BufRead,BufNewFile', '*.rs',   'set filetype=rust'},
  },
  python_formatting = {
    {'FileType', 'python', 'setlocal formatprg="autopep8 -"'},
    {'FileType', 'python', 'nnoremap <leader>y :Black<CR>'},
  },
  completion_settings = {
    {'FileType', 'ruby', 'setlocal omnifunc=rubycomplete#Complete'},
    {'FileType', 'ruby', 'let g:rubycomplete_buffer_loading=1'},
    {'FileType', 'ruby', 'let g:rubycomplete_classes_in_global=1'},
    {'FileType', 'haskell', 'setlocal omnifunc=necoghc#omnifunc'},
  },
}

nvim_create_augroups(ft_autocmds)

vim.filetype.add({
  extension = {
    cue = 'cue',
    ly = 'lilypond',
    ily = 'lilypond',
  },
})

-- key mappings ---------------------------------------------------------------

-- copying and pasting to/from system clipboard
map_key('n', 'cv', '"+p')
map_key('n', 'cp', '"+y')
map_key('x', 'cv', '"+p')
map_key('x', 'cp', '"+y')

vim.g.mapleader = ' '

-- swap mark jump commands
map_key('n', '`', "'")
map_key('n', "'", '`')

-- toggle display of whitespace characters
map_key('n', '<leader>li', ':set list!<CR>')

-- set shortcuts for moving between windows
map_key('n', '<c-j>', '<c-w>j')
map_key('n', '<c-k>', '<c-w>k')
map_key('n', '<c-l>', '<c-w>l')
map_key('n', '<c-h>', '<c-w>h')
-- nnoremap <leader>ws <c-w>s
-- nnoremap <leader>wv <c-w>v
map_key('n', '<leader>-', ':resize -5<CR>')
map_key('n', '<leader>+', ':resize +5<CR>')
map_key('n', '<leader>,', ':vertical resize -5<CR>')
map_key('n', '<leader>.', ':vertical resize +5<CR>')

-- equalize visible buffers
map_key('n', '<leader>we', '<c-w>=')
map_key('n', '<leader>=',  '<c-w>=')
-- maximize current buffer
map_key('n', '<leader>wf', '<c-w><bar><c-w>_')

-- rotate split buffers
map_key('n', '<leader>H', '<c-w>H')
map_key('n', '<leader>J', '<c-w>J')
map_key('n', '<leader>K', '<c-w>K')
map_key('n', '<leader>L', '<c-w>L')

-- set shortcuts for moving between tabs
map_key('n', '<leader>p', ':tabprevious<CR>')
map_key('n', '<leader>n', ':tabnext<CR>')
map_key('n', '<C-p>', ':bprev<CR>')
map_key('n', '<C-n>', ':bnext<CR>')

-- switch to the alternate (last used) buffer
map_key('n', '<C-e>', '<C-^>')

-- delete buffer, leave window intact
map_key('n', '<leader>d', ':Sayonara!<CR>')
-- delete buffer and close window
map_key('n', '<leader>x', ':Sayonara<CR>')
map_key('n', '<leader>D', ':bdelete!<CR>')

-- open new split
map_key('n', '<leader>vv', ':vnew<Space>')
map_key('n', '<leader>ss', ':new<Space>')
map_key('n', '<leader>ee', ':edit<Space>')
map_key('n', '<leader>fe', ':tabedit<Space>')
-- close current tab
map_key('n', '<leader>fd', ':tabclose<CR>')

vim.cmd([[
" open new tab with current buffer and move to the same position
function! OpenCurentBufferInNewTab()
  let l:l = line('.')
  let l:c = col('.')
  tabedit %
  call cursor(l:l, l:c)
endfunction

nnoremap <leader>ff :call OpenCurentBufferInNewTab()<CR>
]])

-- map write and quit to something more sensible
-- nnoremap <leader>ww :w<CR>
map_key('n', '<leader>ww', ':update<CR>')
map_key('n', '<leader>wq', ':wq<CR>')
map_key('n', '<leader>qa', ':qa<CR>')
map_key('n', '<leader>qq', ':quit<CR>')
map_key('n', '<leader>Q',  ':qa!<CR>')
map_key('n', '<C-q>',      ':confirm qall<CR>')
map_key('n', '<leader>X',  ':close<CR>')

-- use Q for macro repeat instead of Ex command mode trigger
map_key('n',  'Q', '@@')

-- disable accidental help triggering
map_key('i', '<F1>', '<nop>')
map_key('n', '<F1>', '<nop>')
map_key('v', '<F1>', '<nop>')

-- spelling
map_key('n', '<leader>sp', ':setlocal spelllang=pl spell!<CR>')
map_key('n', '<leader>se', ':setlocal spelllang=en_US spell!<CR>')
map_key('n', '<leader>sb', ':setlocal spelllang=en_GB spell!<CR>')

-- map omnifunc completion to something more convenient
map_key('i', '<C-f>', '<C-x><C-o>')

vim.cmd([[
" mapping for navigating visual lines
" http://andrewradev.com/2011/04/26/my-vim-workflow-basic-moves/
" https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
"
" use 'j' if preceded by count, 'gj' otherwise. same for 'k' and 'gk'
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
xnoremap <expr> j v:count ? 'j' : 'gj'
xnoremap <expr> k v:count ? 'k' : 'gk'
]])

-- make original movements still available
map_key('n', 'gj', 'j')
map_key('n', 'gk', 'k')
map_key('x', 'gj', 'j')
map_key('x', 'gk', 'k')

-- easily edit configuration files
map_key('n', '<leader>ev', ':edit $MYVIMRC<CR>')
map_key('n', '<leader>ep', ':edit ~/.config/nvim/lua/plugins.lua<CR>')
map_key('n', '<leader>sv', ':source $MYVIMRC<CR>')

-- more consistent n/N behaviour
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.cmd([[
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]
]])

-- http://mixandgo.com/blog/vim-config-for-rails-ninjas
-- Visually select the text that was last edited/pasted
map_key('n', 'gV', '`[v`]')
-- select what you've just pasted
map_key('n', 'gp', '`[v`]')
-- reselect visual block after indent/outdent
map_key('v', '<', '<gv')
map_key('v', '>', '>gv')
-- indent or de-indent a pasted block
map_key('n', '<leader>>', '`[v`]>')
map_key('n', '<leader><', '`[v`]<')
-- remap C-c in insert mode so that it triggers InsertLeave
map_key('i', '<C-c>', '<Esc>')

-- Move line up or down
map_key('n', '<A-j>', ':m .+1<CR>')
map_key('n', '<A-k>', ':m .-2<CR>')
-- Move visual block up or down
map_key('v', 'J',     ":m '>+1<CR>gv=gv")
map_key('v', '<A-j>', ":m '>+1<CR>gv=gv")
map_key('v', 'K',     ":m '<-2<CR>gv=gv")
map_key('v', '<A-k>', ":m '<-2<CR>gv=gv")

map_key('n', '<leader>r', ':nohlsearch<CR>:redraw!<CR>')

-- quickly edit your macros
-- https://github.com/mhinz/vim-galore#quickly-edit-your-macros
vim.cmd([[nnoremap <leader>m :<C-u><C-r>='let @'. v:register .' = '. string(getreg(v:register))<CR><C-f><Left>]])

-- preserve flags from previous :substitute invocation
-- Practical Vim by Drew Neill, p. 227
map_key('n', '&', ':&&<CR>')
map_key('x', '&', ':&&<CR>')

-- neovim terminal navigation
-- https://neovim.io/doc/user/nvim_terminal_emulator.html
-- if has('nvim')
--   tnoremap <A-h> <C-\><C-N><C-w>h
--   tnoremap <A-j> <C-\><C-N><C-w>j
--   tnoremap <A-k> <C-\><C-N><C-w>k
--   tnoremap <A-l> <C-\><C-N><C-w>l
--   inoremap <A-h> <C-\><C-N><C-w>h
--   inoremap <A-j> <C-\><C-N><C-w>j
--   inoremap <A-k> <C-\><C-N><C-w>k
--   inoremap <A-l> <C-\><C-N><C-w>l
--   nnoremap <A-h> <C-w>h
--   nnoremap <A-j> <C-w>j
--   nnoremap <A-k> <C-w>k
--   nnoremap <A-l> <C-w>l
-- endif

vim.g.tmux_navigator_no_mappings = 1
map_key('n', '<A-h>', ':TmuxNavigateLeft<cr>')
map_key('n', '<A-j>', ':TmuxNavigateDown<cr>')
map_key('n', '<A-k>', ':TmuxNavigateUp<cr>')
map_key('n', '<A-l>', ':TmuxNavigateRight<cr>')
map_key('n', '<A-\\>', ':TmuxNavigatePrevious<cr>')
map_key('t', '<A-h>', '<C-\\><C-N>:TmuxNavigateLeft<cr>')
map_key('t', '<A-j>', '<C-\\><C-N>:TmuxNavigateDown<cr>')
map_key('t', '<A-k>', '<C-\\><C-N>:TmuxNavigateUp<cr>')
map_key('t', '<A-l>', '<C-\\><C-N>:TmuxNavigateRight<cr>')

-- neoterm configuration
vim.g.neoterm_position = 'vertical'
map_key('v', '<F2>', ':TREPLSendSelection<CR>')
map_key('n', '<F2>', ':TREPLSendLine<CR>')

map_key('n', '<leader>tc', ':call neoterm#close()<CR>')
map_key('n', '<leader>tl', ':call neoterm#clear()<CR>')
map_key('n', '<leader>tk', ':call neoterm#kill()<CR>')

vim.cmd([[
command! -nargs=+ Tg :T git <args>
command! -nargs=* Tig :T tig <args>
" nnoremap <leader>gg :Tig<Space>
]])

map_key('n', '<leader>g',  ':grep!<Space>')
map_key('n', '<leader>co', ':copen<CR>')
map_key('n', '<leader>cc', ':cclose<CR>')
map_key('n', '<leader>cn', ':cnext<CR>')
map_key('n', '<leader>cp', ':cprev<CR>')

map_key('n', '<leader>lg', ':lgrep!<Space>')
map_key('n', '<leader>lo', ':lopen<CR>')
map_key('n', '<leader>lc', ':lclose<CR>')
map_key('n', '<leader>ln', ':lnext<CR>')
map_key('n', '<leader>lp', ':lprev<CR>')

-- plugin key mappings --------------------------------------------------------

-- fzf
map_key('n', '<leader>o',  ':Files<CR>')
map_key('n', '<leader>hh', ':History<CR>')
map_key('n', '<leader>:',  ':History:<CR>')
map_key('n', '<leader>b',  ':Buffers<CR>')

-- https://github.com/junegunn/vim-easy-align
map_key('v', '<Enter>', '<Plug>(EasyAlign)')
map_key('n', 'ga',      '<Plug>(EasyAlign)')

-- hdevtools
vim.cmd([[
augroup haskell
  autocmd!
  autocmd FileType haskell nnoremap <buffer> <leader>ht :HdevtoolsType<CR>
  autocmd FileType haskell nnoremap <buffer> <leader>hc :HdevtoolsClear<CR>
  autocmd FileType haskell nnoremap <buffer> <leader>hi :HdevtoolsInfo<CR>
augroup END
]])

map_key('n', '<leader>i', ':IndentBlanklineToggle<CR>')

-- gundo
map_key('n', '<F6>', ':UndotreeToggle<CR>')

-- vim-grepper custom command
-- map_key('n', '<leader>/', ':GrepperUg<Space>')
map_key('n', '<leader>/', ':GrepperRg<Space>')

-- ripgrep
-- set grepprg=rg\ --vimgrep\ $*
-- set grepformat=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m
if vim.fn.executable('ugrep') == 1 then
  vim.opt.grepprg = 'ugrep -RInk -j --tabs=1 --ignore-files --width=384'
  vim.opt.grepformat = '%f:%l:%c:%m,%f+%l+%c+%m,%-G%f|%l|%c|%m'
end

vim.cmd([[
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
]])

-- vim-interestingwords
vim.g.interestingWordsDefaultMappings = 0
map_key('n', '<leader>a', ":call InterestingWords('n')<CR>")
map_key('v', '<leader>a', ":call InterestingWords('v')<CR>")
map_key('n', '<leader>A', ':call UncolorAllWords()<CR>')
map_key('n', 'n',         ':call WordNavigation(1)<CR>')
map_key('n', 'N',         ':call WordNavigation(0)<CR>')

-- vim-sandwich recommendation
map_key('n', 's', '<NOP>')
map_key('x', 's', '<NOP>')

-- zeavim filetype -> docset mappings
vim.g.zv_file_types = {
  ['Dockerfile'] = 'docker',
  ['tex'] = 'latex',
  ['sh'] = 'bash',
  ['python'] = 'python_3',
  ['yaml.ansible'] = 'ansible',
}

map_key('v', 'gz', '<Plug>ZVVisSelection')

-- general stuff ---------------------------------------------------------------

-- use exrc but disable shell & writing stuff
vim.opt.exrc = true
vim.opt.secure = true

-- disable backups
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- split settings
vim.opt.splitbelow = true
vim.opt.splitright = true

-- automatically read files changed outside of vim
vim.opt.autoread = true

-- hide intro
vim.opt.shortmess = vim.opt.shortmess + 'I'

-- set zsh-like completion mode
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest,list,full'
vim.opt.wildignore = '*.swp,*.bak,*.pyc,*.dll,*/.git/**/*,*/.svn/**/*,*.tar.*'

-- enable longer history
vim.opt.history = 2000

-- delete comment character when joining commented lines
vim.opt.formatoptions = vim.opt.formatoptions + 'j'

-- 7.4.427 fixes terminal rendering glitches
vim.opt.updatetime = 250

vim.cmd([[
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
]])

-- smarter command-line history
map_key('c', '<C-n>', '<Down>')
map_key('c', '<C-p>', '<Up>')

-- leave 3 lines at the top or bottom of view when scrolling up or down
vim.opt.scrolloff = 3

vim.cmd([[
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

" paste stuff into termbin, get back URL
" https://www.reddit.com/r/vim/comments/7bj837/favorite_console_tools_to_use_with_vim/
if executable('nc') && executable('tr') && executable('xclip')
  command! -range=% TB <line1>,<line2>w !nc termbin.com 9999 | tr -d '\n' | xclip -selection clipboard
endif

" show option values
" https://www.reddit.com/r/vim/comments/7g4afp/using_tabs_only/
command! -bar -nargs=1 -complete=option Vov echo 'local: '
      \| verbose setlocal <args>?
      \| echo 'global: '
      \| verbose setglobal <args>?
]])

vim.api.nvim_create_user_command('SSHFile', ':call SSHFile(<f-args>)', { complete = 'file', nargs = '*' })
map_key('n', '<leader>sh', ':SSHFile<Space>')

-- plugin configuration --------------------------------------------------------

-- folke/todo-comments.nvim
map_key('n', '<leader>tt', '<cmd>TroubleToggle<cr>')
map_key('n', '<leader>tl', '<cmd>TroubleToggle loclist<cr>')

-- psf/black
vim.g.black_linelength = 79

-- rust LSP
vim.g.LanguageClient_serverCommands = {
  rust = {'rustup', 'run', 'nightly', 'rls'},
  python = {'/usr/local/bin/pyls'},
  tex = {'texlab'},
}

vim.g.LanguageClient_autoStart = 1

map_key('n', '<F5>', ':call LanguageClient_contextMenu()<CR>')
map_key('n', 'K',    ':call LanguageClient_textDocument_hover()<CR>')
map_key('n', 'gd',   ':call LanguageClient_textDocument_definition()<CR>')
map_key('n', '<F2>', ':call LanguageClient_textDocument_rename()<CR>')

vim.cmd([[
" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

source ~/.vim/custom/plugins/hexokinase.vim
source ~/.vim/custom/plugins/autoformat.vim
source ~/.vim/custom/plugins/vim-commentary.vim
source ~/.vim/custom/plugins/vim-go.vim
source ~/.vim/custom/plugins/UltiSnips.vim
source ~/.vim/custom/plugins/python-syntax.vim
source ~/.vim/custom/plugins/fugitive-gitlab.vim
" source ~/.vim/custom/plugins/indentLine.vim
source ~/.vim/custom/plugins/delimitMate.vim
source ~/.vim/custom/plugins/vim-airline.vim
source ~/.vim/custom/plugins/fzf.vim
]])

map_key('n', 'gA', 'ga')

-- mhinz/vim-grepper settings and mappings
vim.g.grepper = {
  ug = {
      grepprg = 'ugrep -RInk -j --tabs=1 --ignore-files=.gitignore --width=384',
      grepformat = '%f:%l:%c:%m,%f+%l+%c+%m,%-G%f|%l|%c%m',
  },
  tools = {'rg', 'git', 'ug'}
}
map_key('n', 'gr', '<Plug>(GrepperOperator)')
map_key('x', 'gr', '<Plug>(GrepperOperator)')

-- lervag/vimtex
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_latexmk = {
  executable = 'latexmk',
  options = {
    '-xelatex',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}

-- vimwiki
-- defines a list of wikis with optional properties
vim.g.vimwiki_list = {
  {path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}
}
-- supertab doesn't work in vimwiki pages if this is on
vim.g.vimwiki_table_mappings = 0
-- disable setting filetype for all .md files (outside of vimwiki_list
-- locations)
vim.g.vimwiki_global_ext = 0
-- use vim-markdown-folding
vim.g.vimwiki_folding = 'expr'

map_key('n', '<leader><F8>', '<Plug>VimwikiToggleListItem')

-- <leader>ww by default
map_key('n', '<leader>wo', '<Plug>VimwikiIndex')
map_key('n', '<leader>wj', '<Plug>VimwikiDiaryNextDay')
map_key('n', '<leader>wk', '<Plug>VimwikiDiaryPrevDay')

-- vim-sneak
vim.g['sneak#label'] = 1

map_key('n', '<leader>S', '<Plug>Sneak_s')

vim.cmd([[
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
]])

-- vim-buftabline
vim.g.buftabline_numbers = 2

vim.g.ale_lint_on_text_changed = 0
vim.g.ale_lint_on_save = 1

-- ansible
vim.g.ansible_unindent_after_newline = 1
vim.g.ansible_extra_keywords_highlight = 1
vim.g.ansible_normal_keywords_highlight = 'Constant'

-- racer
vim.g.completor_filetype_map = {rust = {ft = 'lsp', cmd = 'rls'}}

-- rust.vim
vim.g.rustfmt_autosave = 1

-- vim-shfmt
vim.g.shfmt_extra_args = '-i 2 -bn -ci'

-- vim-prettier
vim.g['prettier#autoformat'] = 0

vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1

-- pandoc
vim.g['pandoc#spell#default_langs'] = {'pl', 'en'}
vim.g['pandoc#fomatting#textwidth'] = 79

-- git-blame.nvim
vim.g.gitblame_date_format = '%Y-%m-%d %H:%M'

-- custom scripts -------------------------------------------------------------

vim.cmd('source ~/.vim/custom/scripts/perltidy.vim')

-- abbreviations --------------------------------------------------------------

vim.cmd('source ~/.vim/custom/abbreviations.vim')

-- backlog functions ----------------------------------------------------------

vim.cmd('source ~/.vim/custom/backlog.vim')

-- apperarance stuff ----------------------------------------------------------

-- GUI font setting
if vim.fn.has('gui_running') == 1 then
  vim.opt.guifont = 'Iosevka 10'
end

-- disable toolbars in GUI
vim.opt.guioptions = 'c'

-- make vertical windows separator thinner
vim.opt.fillchars = 'vert:│'

vim.cmd([[
highlight VertSplit ctermbg=NONE guibg=NONE

" set SignColumn color equal to general background
highlight SignColumn ctermbg=NONE guibg=NONE

" set TabLine background color equal to general background and strip underline
highlight TabLineFill ctermbg=NONE guibg=NONE
highlight BufTabLineFill ctermbg=NONE guibg=NONE
]])

-- print marker at specified column
-- let &colorcolumn = '80,' . join(range(120, 999), ',')
vim.opt.colorcolumn = '80'
-- set the total number of tabs to be opened with the -p command line option
vim.opt.tabpagemax = 30
-- always show the tabs bar
vim.opt.showtabline = 2
-- show cursor position in status bar
vim.opt.ruler = true
-- show typed command in status bar
vim.opt.showcmd = true
-- show filename in status bar
vim.opt.title = true
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.number = true
-- use 2 lines for status bar
vim.opt.laststatus = 2
vim.opt.cursorline = true

vim.cmd([[
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
]])

-- colorscheme settings --------------------------------------------------------

vim.opt.background = 'dark'

-- true colour support
vim.o.t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"
vim.o.t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"
vim.opt.termguicolors = true

vim.cmd('colorscheme gruvbox')

-- gruvbox light blue (listchars, wrapped line marks etc.)
vim.cmd('highlight NonText guifg=#83a598')

vim.g.airline_theme = 'base16_gruvbox_dark_medium'

vim.cmd([[
source ~/.vim/custom/plugins/tree-sitter-highlight.vim
source ~/.vim/custom/plugins/indent-blankline.vim
]])
vim.g.terminal_color_0  = '#282828'
vim.g.terminal_color_1  = '#cc241d'
vim.g.terminal_color_2  = '#98971a'
vim.g.terminal_color_3  = '#d79921'
vim.g.terminal_color_4  = '#458588'
vim.g.terminal_color_5  = '#b16286'
vim.g.terminal_color_6  = '#689d6a'
vim.g.terminal_color_7  = '#a89984'
vim.g.terminal_color_8  = '#928374'
vim.g.terminal_color_9  = '#fb4934'
vim.g.terminal_color_10 = '#b8bb26'
vim.g.terminal_color_11 = '#fabd2f'
vim.g.terminal_color_12 = '#83a598'
vim.g.terminal_color_13 = '#d3869b'
vim.g.terminal_color_14 = '#8ec07c'
vim.g.terminal_color_15 = '#ebdbb2'

-- folding settings ------------------------------------------------------------

-- enable folding based on indentation
vim.opt.foldmethod = 'indent'
-- disable automatic folding on file opening
vim.opt.foldenable = false

vim.cmd('source ~/.vim/custom/plugins/tree-sitter-folding.vim')

-------------------------------------------------------------------------------

-- https://www.reddit.com/r/kubernetes/comments/ehpr5z/syntax_highlighting_for_helm_templates_in_vim/
vim.cmd([[
function! HelmSyntax()
  set filetype=yaml
  unlet b:current_syntax
  syn include @yamlGoTextTmpl ~/.vim/plugged/vim-go/syntax/gotexttmpl.vim
  let b:current_syntax = "yaml"
  syn region goTextTmpl start=/{{/ end=/}}/ contains=@gotplLiteral,gotplControl,gotplFunctions,gotplVariable,goTplIdentifier containedin=ALLBUT,goTextTmpl keepend
  hi def link goTextTmpl PreProc
endfunction
augroup helm_syntax
  autocmd!
  autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl call HelmSyntax()
augroup END

" -----------------------------------------------------------------------------

language en_US.utf8
]])
