fun! s:paste(cmd)
    echom 'normal! '.a:cmd
    silent! execute 'normal! '.a:cmd
endf

fun! s:pasteInNormalMode(reg)
    call s:paste(printf('"%sp',a:reg))
endf

fun! s:pasteInInsertMode(reg)
    let curPos = getcurpos()
    if curPos[4] ==? virtcol('$')
        " if curwant is line end, then append paste content
        call s:paste(printf('"%sp',a:reg))
    else
        call s:paste(printf('"%sP',a:reg))
        " fix bug: move right to correct cursor position
        silent! normal! l
    endif
endf

fun! s:pasteInVisualMode(reg)
    silent! normal! gvd
    call s:paste(printf('"%sP',a:reg))
endf

fun! autopaste#paste(mode,reg)
    let flag = &paste
    set paste

    if a:mode ==? 'n'
        call s:pasteInNormalMode(a:reg)
    elseif a:mode ==? 'i'
        call s:pasteInInsertMode(a:reg)
    elseif a:mode ==? 'v'
        call s:pasteInVisualMode(a:reg)
    endif
    let &paste = flag
endf
