augroup over80_highlight
    au!
    au VimResized,VimEnter * call g:over80#enable_highlight()
    au CursorHold * call g:over80#enable_highlight()
augroup end

augroup over80_quickfix
    au!
    au FileType qf call g:over80#disable_highlight()
    au FileType unite call g:over80#disable_highlight()
augroup end

fun! g:over80#disable_highlight()
    if exists('searchparty#mash#unmash')
        call searchparty#mash#umash()
    endif
    set cc=""
endfun

fun! g:over80#enable_highlight()
    " disable highlighting for quickfix
    if &filetype == 'qf'
        return
    endif

    " integration with searchparty
    if exists("b:mash_search_item")
        for m in getmatches()
            if m.id == b:mash_search_item
                return g:over80#disable_highlight()
            endif
        endfor
    endif

    try
        if searchpos(@/, 'nc') == [line('.'), col('.')]
            return g:over80#disable_highlight()
        endif
    catch E54
    catch E35
    endtry

    if &columns > 80
        let &cc=join(range(80, &columns), ',')
    endif
endfun
