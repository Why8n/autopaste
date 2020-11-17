" automatically set paste flag when paste
" Maintainer: Why8n
" License: MIT license

if exists("g:loaded_autopaste")
    finish
endif
let g:loaded_autopaste = 1

let s:save_cpoptions = &cpoptions
set cpo&vim

command! -nargs=1 PasteInNormalMode :call autopaste#paste('n',<f-args>)
command! -nargs=1 PasteInInsertMode :call autopaste#paste('i',<f-args>)
command! -nargs=1 -range PasteInVisualMode :call autopaste#paste('v',<f-args>)

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
