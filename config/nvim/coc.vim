let g:coc_global_extensions = [
	\ 'coc-tsserver',
	\ 'coc-emmet',
	\ 'coc-vetur',
	\ 'coc-html',
	\ 'coc-css',
	\ 'coc-highlight',
	\ 'coc-spell-checker',
	\ 'coc-json',
	\ 'coc-prettier',
	\ 'coc-eslint',
\ ]

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd BufWritePre *.vue Prettier
