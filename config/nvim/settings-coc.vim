" Go To Definition
nmap <silent> gd <Plug>(coc-definition)
" Auto-select the First Completion Item and Notify coc.nvim to Format on Enter
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Show Documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Go Through The Completions
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Refresh & Show Completions
inoremap <silent><expr> <c-space> coc#refresh()

" Formatting selected code.
xmap <leader>f	<Plug>(coc-format-selected)
nmap <leader>f	<Plug>(coc-format-selected)

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~# '\s'
endfunction

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
