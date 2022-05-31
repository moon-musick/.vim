" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection    = "gnn",
      node_incremental  = "grn",
      scope_incremental = "grc",
      node_decremental  = "grm",
    },
  },
}
EOF

if has('nvim')
  highlight TSConstBuiltin guifg=#d3869b
  highlight TSConstant guifg=#ebdbb2
  highlight TSFuncBuiltin gui=NONE guifg=#fe8019
  highlight TSFunction guifg=#fabd2f
  highlight TSInclude guifg=#83a598
  highlight TSKeywordOperator guifg=#fb4934
  highlight TSMethod guifg=#fabd2f
  highlight TSParameter guifg=#ebdbb2
  highlight TSParameterReference guifg=#ebdbb2
  highlight TSPunctBracket guifg=#a89984
  highlight TSPunctDelimiter guifg=#a89984
  highlight TSStringEscape guifg=#fe8019
  highlight TSType guifg=#8ec07c

  " `TSAnnotation` For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
  " `TSAttribute`
  " `TSBoolean` For booleans.
  " `TSCharacter` For characters.
  " `TSComment` For comment blocks.
  " `TSConditional` For keywords related to conditionnals.
  " `TSConstant` For constants
  " `TSConstBuiltin` For constant that are built in the language: `nil` in Lua.
  " `TSConstMacro` For constants that are defined by macros: `NULL` in C.
  " `TSConstructor` For constructor calls and definitions: `{}` in Lua, and Java constructors.
  " `TSError` For syntax/parser errors.
  " `TSException` For exception related keywords.
  " `TSField` For fields.
  " `TSFloat` For floats.
  " `TSFunction` For function (calls and definitions).
  " `TSFuncBuiltin` For builtin functions: `table.insert` in Lua.
  " `TSFuncMacro` For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
  " `TSInclude` For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
  " `TSKeyword` For keywords that don't fall in previous categories.
  " `TSKeywordFunction` For keywords used to define a fuction.
  " `TSKeywordOperator` for operators that are English words, e.g. `and`, `as`, `or`.
  " `TSLabel` For labels: `label:` in C and `:label:` in Lua.
  " `TSMethod` For method calls and definitions.
  " `TSNamespace` For identifiers referring to modules and namespaces.
  " `TSNone` For no highlighting.
  " `TSNumber` For all numbers
  " `TSOperator` For any operator: `+`, but also `->` and `*` in C.
  " `TSParameter` For parameters of a function.
  " `TSParameterReference` For references to parameters of a function.
  " `TSProperty` Same as `TSField`.
  " `TSPunctDelimiter` For delimiters ie: `.`
  " `TSPunctBracket` For brackets and parens.
  " `TSPunctSpecial` For special punctutation that does not fall in the catagories before.
  " `TSRepeat` For keywords related to loops.
  " `TSString` For strings.
  " `TSStringRegex` For regexes.
  " `TSStringEscape` For escape characters within a string.
  " `TSSymbol` For identifiers referring to symbols or atoms.
  " `TSTag` Tags like html tag names.
  " `TSTagDelimiter` Tag delimiter like `<` `>` `/`
  " `TSText` For strings considered text in a markup language.
  " `TSStrong` For text to be represented in bold.
  " `TSEmphasis` For text to be represented with emphasis.
  " `TSUnderline` For text to be represented with an underline.
  " `TSStrike` For strikethrough text.
  " `TSTitle` Text that is part of a title.
  " `TSLiteral` Literal text.
  " `TSURI` Any URI like a link or email.
  " `TSMath` For LaTex-like math environments.
  " `TSTextReference` For footnotes, text references, citations.
  " `TSEnviroment` For text environments of markup languages.
  " `TSEnviromentName` For the name/the string indicating the type of text environment.
  " `TSNote` Text representation of an informational note.
  " `TSWarning` Text representation of a warning note.
  " `TSDanger` Text representation of a danger note.
  " `TSType` For types.
  " `TSTypeBuiltin` For builtin types.
  " `TSVariable` Any variable name that does not have another highlight.
  " `TSVariableBuiltin` Variable names that are defined by the languages, like `this` or `self`.
endif

