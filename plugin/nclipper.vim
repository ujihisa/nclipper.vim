function! s:nclipper(with_filename)
  if visualmode() !=# 'V'
    echoerr 'use V'
    return
  endif
  let [begin, end] = [getpos("'<")[1], getpos("'>")[1]]
  let max_len = len(end)
  let value = (a:with_filename ? @% . ":" . "\n" : '') .
        \ join(map(getline(begin, end), g:nclipper_format), "\n")
  if has('xterm_clipboard')
    call setreg('+', value, "V")
  else
    call setreg('"', value, "V")
  endif

endfunction

vnoremap <silent> <Plug>(nclipper) :<C-u>call <SID>nclipper(0)<Cr>
vnoremap <silent> <Plug>(nclipper-with-filename) :<C-u>call <SID>nclipper(1)<Cr>
if (!exists('g:nclipper_nomap') || !g:nclipper_nomap)
\   && !hasmapto('<Plug>(nclipper)', 'v', 0)
  silent! vmap <unique> <C-y> <Plug>(nclipper)
  silent! vmap <unique> <M-y> <Plug>(nclipper-with-filename)
endif

if !exists('g:nclipper_format')
  " TODO: Support Funcref
  let g:nclipper_format = 'printf("%" . max_len . "d %s", v:key + begin, v:val)'
endif
