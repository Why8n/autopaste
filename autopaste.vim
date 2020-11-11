silent

fun! s:paste(mode,pasteCmd)
    let flag = &paste
    set paste

    echom a:mode.' '.a:pasteCmd
    if a:mode ==? 'n' 
        execute "normal! ".a:pasteCmd
    elseif a:mode ==? 'i'
        startinsert
        call feedkeys(a:pasteCmd)
    elseif a:mode ==? 'v'
        execute "normal! gvd"
        execute "normal! ".a:pasteCmd
    endif

    let &paste = flag
endf


command! -nargs=1 PasteInNormalMode :call <SID>paste('n',<f-args>)
command! -nargs=1 PasteInInsertMode :call <SID>paste('i',<f-args>)
command! -nargs=1 -range PasteInVisualMode :call <SID>paste('v',<f-args>)

" nnoremap <silent> <C-v> :call <SID>paste('n','"+p')<CR>

" notice: <C-r> will be transfer to the true data,then call paste()
" inoremap <silent> <C-v> <C-o>:call <SID>paste('i','<C-r>+')<CR>

nnoremap <silent> <C-v> :PasteInNormalMode "+p<CR>
inoremap <silent> <C-v> <C-o>:PasteInInsertMode <C-r>+<CR>
vnoremap <silent> <C-v> :<C-u>PasteInVisualMode "+P<CR>
cnoremap <C-v> <C-r>+


