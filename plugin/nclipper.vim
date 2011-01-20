function! s:nclipper()
  if visualmode() !=# 'V'
    echoerr 'use V'
    return
  endif
  let end = getpos("'>")[1]
  let lines = getline(getpos("'<")[1], end)
  let beginning = getpos('.')[1]
  let value = join(map(lines, 'printf("%" . len(end) . "d %s", v:key + beginning, v:val)'), "\n")
  call setreg('+', value, "V")
endfunction

vnoremap <silent> <Plug>(nclipper) :<C-u>call <SID>nclipper()<Cr>
if (!exists('g:nclipper_nomap') || !g:nclipper_nomap)
\   && !hasmapto('<Plug>(nclipper)', 'v', 0)
  silent! vmap <unique> <C-y> <Plug>(nclipper)
endif
