Enable indication of 80 character limit for text by using `cursorcolumn`.

Unfortunately, there are highlighting issues with this approach, in which
background syntax coloring is not applying to the charachers with the same
column number as 'cursorcolumn'; so the hack was made to disable this
highlighting in the case of searching, so matched text located in the
'cursorcolumn' still be visible.

Usage
=====

With simple search command:
```
nnoremap / :call g:over80#disable_highlight()<CR>/
nnoremap ? :call g:over80#disable_highlight()<CR>?
```

With [vim-over](https://github.com/osyo-manga/vim-over):
```
nnoremap / :call g:over80#disable_highlight()
    \ <CR>:OverCommandLine /<CR>

nnoremap ? :call g:over80#disable_highlight()
    \ <CR>:OverCommandLine ?<CR>
```
