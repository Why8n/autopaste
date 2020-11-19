## autopaste
when we paste directly into vim, the content sometimes may get confused. This is something releated to the `autoindent` flag, vim will assume the paste content has been typed by the user, so it will indent each line, and cause the confused formating.

usually we have to type `set paste` manually to keep the format of the paste content, and `set nopaste` when done.\
more detail message, please refer to [Toggle auto-indenting for code paste].

so here comes [autopaste], which will automatically `set paste` when we paste something.

## Install
- by [dein.vim]:
```vim
call dein#add('Why8n/autopaste', {
            \'on_cmd': [
                \'PasteInNormalMode',
                \'PasteInInsertMode',
                \'PasteInVisualMode'
                \]
            \})
```

## Configuration
[autopaste] offers some cmomands to help you do the paste, you can configure like below:
```vim
" + is the register, you can replace to other registers
nnoremap <silent> <C-v> :PasteInNormalMode +<CR>
inoremap <silent> <C-v> <C-o>:PasteInInsertMode +<CR>
vnoremap <silent> <C-v> :<C-u>PasteInVisualMode +<CR>
" for command line paste
cnoremap <C-v> <C-r>+
```





[Toggle auto-indenting for code paste]:https://vim.fandom.com/wiki/Toggle_auto-indenting_for_code_paste



[autopaste]:https://github.com/Why8n/autopaste

[dein.vim]:https://github.com/Shougo/dein.vim
