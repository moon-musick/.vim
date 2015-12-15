" generated from apparmor.vim.in by create-apparmor.vim.py
" do not edit this file - edit apparmor.vim.in or create-apparmor.vim.py instead

" ----------------------------------------------------------------------
"    Copyright (c) 2005 Novell, Inc. All Rights Reserved.
"    Copyright (c) 2006-2012 Christian Boltz. All Rights Reserved.
"
"    This program is free software; you can redistribute it and/or
"    modify it under the terms of version 2 of the GNU General Public
"    License as published by the Free Software Foundation.
"
"    This program is distributed in the hope that it will be useful,
"    but WITHOUT ANY WARRANTY; without even the implied warranty of
"    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"    GNU General Public License for more details.
"
"    You should have received a copy of the GNU General Public License
"    along with this program; if not, contact Novell, Inc.
"
"    To contact Novell about this file by physical or electronic mail,
"    you may find current contact information at www.novell.com.
"
"    To contact Christian Boltz about this file by physical or electronic
"    mail, you may find current contact information at www.cboltz.de/en/kontakt.
"
"    If you want to report a bug via bugzilla.novell.com, please assign it
"    to suse-beta[AT]cboltz.de (replace [AT] with @).
" ----------------------------------------------------------------------
"
" stick this file into ~/.vim/syntax/ and add these commands into your .vimrc
" to have vim automagically use this syntax file for these directories:
"
" autocmd BufNewFile,BufRead /etc/apparmor.d/*                      set syntax=apparmor
" autocmd BufNewFile,BufRead /usr/share/apparmor/extra-profiles/*   set syntax=apparmor

" profiles are case sensitive
syntax case match

" color setup...

" adjust colors according to the background

" switching colors depending on the background color doesn't work
" unfortunately, so we use colors that work with light and dark background.
" Patches welcome ;-)

"if &background == "light"
" light background
	hi sdProfileName ctermfg=lightblue
	hi sdHatName ctermfg=darkblue
	hi sdExtHat ctermfg=darkblue
"	hi sdComment2 ctermfg=darkblue
	hi sdGlob       ctermfg=darkmagenta
	hi sdAlias      ctermfg=darkmagenta
	hi sdEntryWriteExec     ctermfg=black ctermbg=yellow
	hi sdEntryUX     ctermfg=darkred cterm=underline
	hi sdEntryUXe     ctermfg=darkred
	hi sdEntryIX     ctermfg=darkcyan
	hi sdEntryM     ctermfg=darkcyan
	hi sdEntryPX     ctermfg=darkgreen cterm=underline
	hi sdEntryPXe     ctermfg=darkgreen
	hi sdEntryW     ctermfg=darkyellow
	hi sdCap	ctermfg=lightblue
	hi sdSetCap     ctermfg=black ctermbg=yellow
	hi sdNetwork	ctermfg=lightblue
	hi sdNetworkDanger ctermfg=darkred
	hi sdCapKey	cterm=underline ctermfg=lightblue
	hi sdCapDanger ctermfg=darkred
	hi sdRLimit ctermfg=lightblue
	hi def link sdEntryR Normal
	hi def link sdEntryK Normal
	hi def link sdFlags Normal
	hi sdEntryChangeProfile     ctermfg=darkgreen cterm=underline
"else
" dark background
"	hi sdProfileName ctermfg=white
"	hi sdHatName ctermfg=white
"	hi sdGlob       ctermfg=magenta
"	hi sdEntryWriteExec     ctermfg=black ctermbg=yellow
"	hi sdEntryUX     ctermfg=red cterm=underline
"	hi sdEntryUXe     ctermfg=red
"	hi sdEntryIX     ctermfg=cyan
"	hi sdEntryM     ctermfg=cyan
"	hi sdEntryPX     ctermfg=green cterm=underline
"	hi sdEntryPXe     ctermfg=green
"	hi sdEntryW     ctermfg=yellow
"	hi sdCap	ctermfg=lightblue
"	hi sdCapKey	cterm=underline ctermfg=lightblue
"	hi def link sdEntryR Normal
"	hi def link sdFlags Normal
"	hi sdCapDanger ctermfg=red
"endif

hi def link sdInclude     Include
high def link sdComment     Comment
"high def link sdComment2     Comment
high def link sdFlagKey     TODO
high def link sdError      ErrorMsg


" always sync from the start.  should be relatively quick since we don't have
" that many rules and profiles shouldn't be _extremely_ large...
syn sync fromstart

syn keyword	sdFlagKey	complain debug

" highlight invalid syntax
syn match sdError /{/ contained
syn match sdError /}/
syn match sdError /^.*$/ contains=sdComment "highlight all non-valid lines as error
" TODO: do not mark lines containing only whitespace as error

" TODO: the sdGlob pattern is not anchored with ^ and $, so it matches all lines matching ^@{...}.*
" This allows incorrect lines also and should be checked better.
" This also (accidently ;-) includes variable definitions (@{FOO}=/bar)
" TODO: make a separate pattern for variable definitions, then mark sdGlob as contained
syn match sdGlob /\v\?|\*|\{.*,.*\}|[[^\]]\+\]|\@\{[a-zA-Z][a-zA-Z0-9_]*\}/

syn match sdAlias /\v^alias\s+(\/|\@\{\S*\})\S*\s+-\>\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment

" syn match sdComment /#.*/

syn cluster sdEntry contains=sdEntryWriteExec,sdEntryR,sdEntryW,sdEntryIX,sdEntryPX,sdEntryPXe,sdEntryUX,sdEntryUXe,sdEntryM,sdCap,sdSetCap,sdExtHat,sdRLimit,sdNetwork,sdNetworkDanger,sdEntryChangeProfile


" TODO: support audit and deny keywords for all rules (not only for files)
" TODO: higlight audit and deny keywords everywhere

" Capability line

" normal capabilities - really keep this list? syn match sdCap should be enough... (difference: sdCapKey words would loose underlining)
syn keyword  sdCapKey          block_suspend chown dac_override dac_read_search fowner fsetid ipc_lock ipc_owner kill lease linux_immutable mknod net_admin net_bind_service net_broadcast net_raw setfcap setgid setpcap setuid syslog sys_boot sys_chroot sys_nice sys_pacct sys_ptrace sys_resource sys_time sys_tty_config wake_alarm

" dangerous capabilities - highlighted separately
syn keyword sdCapDanger	       audit_control audit_write mac_override mac_admin set_fcap sys_admin sys_module sys_rawio

" full line. Keywords are from sdCapKey + sdCapDanger
syn match  sdCap /\v^\s*(audit\s+)?(deny\s+|allow\s+)?capability\s+((audit_control|audit_write|block_suspend|chown|dac_override|dac_read_search|fowner|fsetid|ipc_lock|ipc_owner|kill|lease|linux_immutable|mac_admin|mac_override|mknod|net_admin|net_bind_service|net_broadcast|net_raw|setfcap|setgid|setpcap|setuid|syslog|sys_admin|sys_boot|sys_chroot|sys_module|sys_nice|sys_pacct|sys_ptrace|sys_rawio|sys_resource|sys_time|sys_tty_config|wake_alarm)\s+)*(audit_control|audit_write|block_suspend|chown|dac_override|dac_read_search|fowner|fsetid|ipc_lock|ipc_owner|kill|lease|linux_immutable|mac_admin|mac_override|mknod|net_admin|net_bind_service|net_broadcast|net_raw|setfcap|setgid|setpcap|setuid|syslog|sys_admin|sys_boot|sys_chroot|sys_module|sys_nice|sys_pacct|sys_ptrace|sys_rawio|sys_resource|sys_time|sys_tty_config|wake_alarm)\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdCapKey,sdCapDanger,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
" all capabilities ('capability' without any keyword)
syn match  sdCapDanger /\v^\s*(audit\s+)?(deny\s+|allow\s+)?capability\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" Network line
" Syntax: network domain (inet, ...) type (stream, ...) protocol (tcp, ...)
" TODO: 'owner' isn't supported, but will be (JJ, 2011-01-11)
syn match  sdNetwork         /\v^\s*(audit\s+)?(deny\s+|allow\s+)?network(\s+(unix|inet|ax25|ipx|appletalk|netrom|bridge|atmpvc|x25|inet6|rose|netbeui|security|key|netlink|packet|ash|econet|atmsvc|rds|sna|irda|pppox|wanpipe|llc|can|tipc|bluetooth|iucv|rxrpc|isdn|phonet|ieee802154|caif|alg|nfc|vsock))?(\s+(stream|dgram|seqpacket|rdm|packet))?(\s+tcp|\s+udp|\s+icmp)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
" network rules containing 'raw'
syn match  sdNetworkDanger         /\v^\s*(audit\s+)?(deny\s+|allow\s+)?network(\s+(unix|inet|ax25|ipx|appletalk|netrom|bridge|atmpvc|x25|inet6|rose|netbeui|security|key|netlink|packet|ash|econet|atmsvc|rds|sna|irda|pppox|wanpipe|llc|can|tipc|bluetooth|iucv|rxrpc|isdn|phonet|ieee802154|caif|alg|nfc|vsock))?(\s+(raw))(\s+tcp|\s+udp|\s+icmp)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
" 'all networking' includes raw -> mark as dangerous
syn match  sdNetworkDanger         /\v^\s*(audit\s+)?(deny\s+|allow\s+)?network\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude


" Change Profile
" TODO: audit and deny support will be added (JJ, 2011-01-11)
syn match   sdEntryChangeProfile    /\v^\s*change_profile\s+-\>\s+\S+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude


" rlimit
" TODO: audit and deny support will be added (JJ, 2011-01-11)
"
"syn match sdRLimit /\v^\s*rlimit\s+()\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment
syn match sdRLimit /\v^\s*set\s+rlimit\s+(nofile|ofile|nproc|rtprio)\s+\<\=\s+[0-9]+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment
syn match sdRLimit /\v^\s*set\s+rlimit\s+(locks|sigpending)\s+\<\=\s+[0-9]+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment
syn match sdRLimit /\v^\s*set\s+rlimit\s+(fsize|data|stack|core|rss|as|memlock|msgqueue)\s+\<\=\s+[0-9]+([KMG]B)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment
syn match sdRLimit /\v^\s*set\s+rlimit\s+nice\s+\<\=\s+(-1?[0-9]|-20|1?[0-9])\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment
syn match sdRLimit /\v^\s*set\s+rlimit\s+cpu\s+\<\=\s+[0-9]+(seconds|minutes|hours|days)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment
syn match sdRLimit /\v^\s*set\s+rlimit\s+rttime\s+\<\=\s+[0-9]+(ms|seconds|minutes)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment
syn match sdRLimit /\v^\s*set\s+rlimit\s+(cpu|rttime|nofile|nproc|rtprio|locks|sigpending|fsize|data|stack|core|rss|as|memlock|msgqueue|nice)\s+\<\=\s+infinity\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment

" link rules
syn match sdEntryW /\v^\s+(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?link\s+(subset\s+)?(\/|\@\{\S*\})\S*\s+-\>\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment


syn match sdExtHat  /\v^\s+(\^|hat\s+|profile\s+)\S+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdComment " hat without {...}




syn match sdProfileName /\v^((profile\s+)?\/\S+|profile\s+([a-zA-Z0-9]\S*\s)?\S+)\s+((flags\s*\=\s*)?\(\s*(complain|audit|attach_disconnected|no_attach_disconnected|chroot_attach|chroot_no_attach|chroot_relative|namespace_relative|mediate_deleted|delegate_deleted)(\s*,\s*(complain|audit|attach_disconnected|no_attach_disconnected|chroot_attach|chroot_no_attach|chroot_relative|namespace_relative|mediate_deleted|delegate_deleted))*\s*\)\s+)=\{/ contains=sdProfileStart,sdHatName,sdFlags,sdComment,sdGlob
syn match sdProfileStart /{/ contained
syn match sdProfileEnd /^}\s*(#.*)?$/ contained " TODO: syn region does not (yet?) allow usage of comment in end=
                                                " TODO: Removing the $ mark from end= will allow non-comments also :-(
syn match sdHatName /\v^\s+(\^|hat\s+|profile\s+)\S+\s+((flags\s*\=\s*)?\(\s*(complain|audit|attach_disconnected|no_attach_disconnected|chroot_attach|chroot_no_attach|chroot_relative|namespace_relative|mediate_deleted|delegate_deleted)(\s*,\s*(complain|audit|attach_disconnected|no_attach_disconnected|chroot_attach|chroot_no_attach|chroot_relative|namespace_relative|mediate_deleted|delegate_deleted))*\s*\)\s+)=\{/ contains=sdProfileStart,sdFlags,sdComment
syn match sdHatStart /{/ contained
syn match sdHatEnd /}/ contained " TODO: allow comments + [same as for syn match sdProfileEnd]
syn match sdFlags /\v((flags\s*\=\s*)?\(\s*(complain|audit|attach_disconnected|no_attach_disconnected|chroot_attach|chroot_no_attach|chroot_relative|namespace_relative|mediate_deleted|delegate_deleted)(\s*,\s*(complain|audit|attach_disconnected|no_attach_disconnected|chroot_attach|chroot_no_attach|chroot_relative|namespace_relative|mediate_deleted|delegate_deleted))*\s*\)\s+)/ contained contains=sdFlagKey

syn match sdComment /\s*#.*$/
" NOTE: contains=sdComment changes #include highlighting to comment color.
" NOTE: Comment highlighting still works without contains=sdComment.
syn match sdInclude /\s*#include\s<\S*>/ " TODO: doesn't check until $
syn match sdInclude /\s*include\s<\S*>/  " TODO: doesn't check until $

" basic profile block...
" \s+ does not work in end=, therefore using \s\s*
syn region Normal start=/\v^(profile\s+)?\S+\s+((flags\s*\=\s*)?\(\s*(complain|audit|attach_disconnected|no_attach_disconnected|chroot_attach|chroot_no_attach|chroot_relative|namespace_relative|mediate_deleted|delegate_deleted)(\s*,\s*(complain|audit|attach_disconnected|no_attach_disconnected|chroot_attach|chroot_no_attach|chroot_relative|namespace_relative|mediate_deleted|delegate_deleted))*\s*\)\s+)=\{/ matchgroup=sdProfileEnd end=/^}\s*$/ contains=sdProfileName,Hat,@sdEntry,sdComment,sdError,sdInclude
syn region Hat start=/\v^\s+(\^|hat\s+|profile\s+)\S+\s+((flags\s*\=\s*)?\(\s*(complain|audit|attach_disconnected|no_attach_disconnected|chroot_attach|chroot_no_attach|chroot_relative|namespace_relative|mediate_deleted|delegate_deleted)(\s*,\s*(complain|audit|attach_disconnected|no_attach_disconnected|chroot_attach|chroot_no_attach|chroot_relative|namespace_relative|mediate_deleted|delegate_deleted))*\s*\)\s+)=\{/ matchgroup=sdHatEnd end=/^\s\s*}\s*$/ contains=sdHatName,@sdEntry,sdComment,sdError,sdInclude

" file permissions





" file rules added with create_file_rule()

" write + exec/mmap - danger! (known bug: accepts aw to keep things simple)
syn match  sdEntryWriteExec  /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+(l|r|w|a|m|k|[iuUpPcC]x)+(\s+-\>\s+\S+)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryWriteExec  /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+(l|r|w|a|m|k|[iuUpPcC]x)+(\s+-\>\s+\S+)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryWriteExec  /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(l|r|w|a|m|k|[iuUpPcC]x)+(\s+-\>\s+\S+)?\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryWriteExec  /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(l|r|w|a|m|k|[iuUpPcC]x)+(\s+-\>\s+\S+)?\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" ux(mr) - unconstrained entry, flag the line red. also includes pux which is unconstrained if no profile exists
syn match  sdEntryUX /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+(r|m|k|ux|pux)+(\s+-\>\s+\S+)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryUX /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+(r|m|k|ux|pux)+(\s+-\>\s+\S+)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryUX /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(r|m|k|ux|pux)+(\s+-\>\s+\S+)?\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryUX /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(r|m|k|ux|pux)+(\s+-\>\s+\S+)?\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" Ux(mr) and PUx(mr) - like ux + clean environment
syn match  sdEntryUXe /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+(r|m|k|Ux|PUx)+(\s+-\>\s+\S+)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryUXe /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+(r|m|k|Ux|PUx)+(\s+-\>\s+\S+)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryUXe /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(r|m|k|Ux|PUx)+(\s+-\>\s+\S+)?\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryUXe /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(r|m|k|Ux|PUx)+(\s+-\>\s+\S+)?\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" px/cx/pix/cix(mrk) - standard exec entry, flag the line blue
syn match  sdEntryPX /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+(r|m|k|px|cx|pix|cix)+(\s+-\>\s+\S+)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryPX /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+(r|m|k|px|cx|pix|cix)+(\s+-\>\s+\S+)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryPX /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(r|m|k|px|cx|pix|cix)+(\s+-\>\s+\S+)?\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryPX /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(r|m|k|px|cx|pix|cix)+(\s+-\>\s+\S+)?\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" Px/Cx/Pix/Cix(mrk) - like px/cx + clean environment
syn match  sdEntryPXe /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+(r|m|k|Px|Cx|Pix|Cix)+(\s+-\>\s+\S+)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryPXe /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+(r|m|k|Px|Cx|Pix|Cix)+(\s+-\>\s+\S+)?\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryPXe /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(r|m|k|Px|Cx|Pix|Cix)+(\s+-\>\s+\S+)?\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryPXe /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(r|m|k|Px|Cx|Pix|Cix)+(\s+-\>\s+\S+)?\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" ix(mr) - standard exec entry, flag the line green
syn match  sdEntryIX /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+(r|m|k|ix)+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryIX /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+(r|m|k|ix)+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryIX /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(r|m|k|ix)+\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryIX /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(r|m|k|ix)+\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" mr - mmap with PROT_EXEC
syn match  sdEntryM /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+(r|m|k)+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryM /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+(r|m|k)+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryM /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(r|m|k)+\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryM /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(r|m|k)+\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" special case: deny x is allowed (does not need to be ix, px, ux or cx)
syn match  sdEntryM /\v^\s*(audit\s+)?deny\s+(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+(r|m|k|x)+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryM /\v^\s*(audit\s+)?deny\s+(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+(r|m|k|x)+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryM /\v^\s*(audit\s+)?deny\s+(owner\s+|other\s+)?(r|m|k|x)+\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryM /\v^\s*(audit\s+)?deny\s+(owner\s+|other\s+)?(r|m|k|x)+\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" write + append is an error
syn match  sdError /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+\S*(w\S*a|a\S*w)\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdError /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+\S*(w\S*a|a\S*w)\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdError /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?\S*(w\S*a|a\S*w)\S*\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdError /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?\S*(w\S*a|a\S*w)\S*\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" write entry, flag the line yellow
syn match  sdEntryW /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+(l|r|w|k)+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryW /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+(l|r|w|k)+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryW /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(l|r|w|k)+\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryW /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(l|r|w|k)+\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" append entry, flag the line yellow
syn match  sdEntryW /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+(l|r|a|k)+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryW /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+(l|r|a|k)+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryW /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(l|r|a|k)+\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryW /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(l|r|a|k)+\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" read entry + locking, currently no highlighting
syn match  sdEntryK /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+[rlk]+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryK /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+[rlk]+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryK /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?[rlk]+\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryK /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?[rlk]+\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

" read entry, no highlighting
syn match  sdEntryR /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?(\/|\@\{\S*\})\S*\s+[rl]+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryR /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?"(\/|\@\{\S*\})\S*"\s+[rl]+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryR /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?[rl]+\s+(\/|\@\{\S*\})\S*\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude
syn match  sdEntryR /\v^\s*(audit\s+)?(deny\s+|allow\s+)?(owner\s+|other\s+)?[rl]+\s+"(\/|\@\{\S*\})\S*"+\s*,(\s*$|(\s*#.*$)\@=)/ contains=sdGlob,sdComment nextgroup=@sdEntry,sdComment,sdError,sdInclude

