let g:NetrwIsOpen=0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

function! ToggleNetrw()
	if g:NetrwIsOpen
		let i = bufnr("$")
		while (i >= 1)
			if (getbufvar(i, "&filetype") == "netrw")
				silent exe "bwipeout " . i
			endif
			let i-=1
		endwhile
		let g:NetrwIsOpen=0
	else
		let g:NetrwIsOpen=1
		silent Lexplore
	endif
endfunction

augroup ProjectDrawer
	" Hack to fix CTRL-L
	autocmd filetype netrw noremap <buffer> <C-l> <C-w>l
	" Toggle netrw via ALT-F
	autocmd filetype netrw noremap <silent> <A-f> :call ToggleNetrw()<CR>
	" Close netrw if it's the only buffer open
	autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
augroup END
