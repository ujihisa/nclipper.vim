function! s:nclipper()
  if visualmode() !=# 'V'
    echoerr 'use V'
    return
  endif
  let [begin, end] = [getpos("'<")[1], getpos("'>")[1]]
  let max_len = len(end)
  let value = @% . ":" . "\n" . join(map(getline(begin, end), g:nclipper_format), "\n")
  if has('xterm_clipboard')
    call setreg('+', value, "V")
  else
    call setreg('"', value, "V")
  endif

endfunction

vnoremap <silent> <Plug>(nclipper) :<C-u>call <SID>nclipper()<Cr>
if (!exists('g:nclipper_nomap') || !g:nclipper_nomap)
\   && !hasmapto('<Plug>(nclipper)', 'v', 0)
  silent! vmap <unique> <C-y> <Plug>(nclipper)
endif

if !exists('g:nclipper_format')
    " TODO: Support Funcref
    let g:nclipper_format = 'printf("%" . max_len . "d %s", v:key + begin, v:val)'
endif
