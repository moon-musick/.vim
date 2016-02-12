function! MakeFZFMenu()

  let l:FZFCommands = [
        \"abort",
        \"Files",
        \"History",
        \"History:",
        \"History/",
        \"Marks",
        \"Windows",
        \"Buffers",
        \"Lines",
        \"BLines",
        \"GitFiles",
        \"Commits",
        \"BCommits",
        \"Tags",
        \"BTags",
        \"Snippets",
        \"Colors",
        \"Commands",
        \"Maps"
        \]

  let l:c = 0

  let l:c = confirm(
        \"Make Menu",
        \"&Files\n"    .
        \"&History\n"  .
        \"History&:\n" .
        \"History&/\n" .
        \"&Marks\n"    .
        \"&Windows\n"  .
        \"&Buffers\n"  .
        \"&Lines\n"    .
        \"BL&ines\n"   .
        \"&GitFiles\n" .
        \"&Commits\n"  .
        \"BC&ommits\n" .
        \"&Tags\n"     .
        \"BT&ags\n"    .
        \"&Snippets\n" .
        \"Colo&rs\n"   .
        \"Comman&ds\n" .
        \"Ma&ps")

  if l:c != 0
     exe ":" . l:FZFCommands[l:c]
  endif
endfunction
