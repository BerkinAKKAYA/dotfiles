let g:NetrwIsOpen=0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

function! OpenTab()
	:normal v
	let g:path=expand('%:p')
	execute 'q!'
	execute 'tabedit' g:path
	:normal <C-w>l
endfunction

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

" Make netrw act like a project Draw
augroup ProjectDrawer
	" Hack to fix CTRL-L
	autocmd filetype netrw noremap <buffer> <C-l> <C-w>l
	" Toggle netrw via ALT-F
	autocmd filetype netrw noremap <silent> <A-f> :call ToggleNetrw()<CR>
	" Open in new tab via CTRL-T
	autocmd filetype netrw noremap <buffer> <C-t> :call OpenTab()<cr>
	" Open netrw automatically
	autocmd VimEnter * :call ToggleNetrw()
	" Focus on editor instead of netrw on first load
	autocmd VimEnter * wincmd p	
	" Close netrw if it's the only buffer open
	autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
augroup END
