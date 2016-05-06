function! TouchNewBacklogFile()
  let newbacklogfile = system("date +'%Y-%m-%d.otl'")
  let _ = system("touch ~/Dropbox/pomodoro/" . newbacklogfile)
endfunction

function! EditLastBacklogFile()
  let lastbacklogfile = system("ls ~/Dropbox/pomodoro/*.otl -t | head -n 2 | tail -n 1")
  execute "edit " . lastbacklogfile
endfunction

function! EditNewBacklogFile()
  let newbacklogfile = system("date +'%Y-%m-%d.otl'")
  execute "edit " . "~/Dropbox/pomodoro/" . newbacklogfile
endfunction

function! Backlog()
  call TouchNewBacklogFile()
  call EditLastBacklogFile()
  :vnew
  call EditNewBacklogFile()
endfunction

command! -nargs=0 Backlog :call Backlog()
