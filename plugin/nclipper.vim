function! s:nclipper()
  if visualmode() !=# 'V'
    echoerr 'use V'
    return
  endif
  let lines = getline(getpos("'<")[1], getpos("'>")[1])
  let beginning = getpos('.')[1]
  let value = join(map(lines, 'printf("%d %s", v:key + beginning, v:val)'), "\n")
  call setreg('+', value, "V")
endfunction

vnoremap <silent> <Plug>(nclipper) :<C-u>call <SID>nclipper()<Cr>
if !exists('g:nclipper_nomap') || !g:nclipper_nomap
  vmap <C-y> <Plug>(nclipper)
endif
