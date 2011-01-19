function! s:nclipper()
  if visualmode() !=# 'V'
    echoerr 'use V'
    return
  endif
  execute 'normal! `<V`>"+y'
  let lines = split(@+, "\n")
  let beginning = getpos('.')[1]
  let @+ = join(map(lines, 'printf("%d %s", v:key + beginning, v:val)'), "\n")
endfunction

vnoremap <Plug>(nclipper) :<C-u>call <SID>nclipper()<Cr>
if !exists('g:nclipper_nomap') || !g:nclipper_nomap
  vmap <C-y> <Plug>(nclipper)
endif
