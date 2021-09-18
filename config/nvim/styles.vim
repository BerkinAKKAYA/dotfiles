
let s:uwu0_gui = "#202829" 
let s:uwu1_gui = "#e74c4c"
let s:uwu2_gui = "#6bb05d" 
let s:uwu3_gui = "#e59e67" 
let s:uwu4_gui = "#53A7BF" 
let s:uwu5_gui = "#ef7cbb" 
let s:uwu6_gui = "#51a39f" 
let s:uwu7_gui = "#c4c4c4" 
let s:uwu8_gui = "#343636" 
let s:uwu9_gui = "#c26f6f"
let s:uwu10_gui = "#8dc776" 
let s:uwu11_gui = "#e7ac7e" 
let s:uwu12_gui = "#6CBAD1"
let s:uwu13_gui = "#d3869b" 
let s:uwu14_gui = "#6db0ad"
let s:uwu15_gui = "#bfbfbf" 

au BufWinEnter * set signcolumn=no

colorscheme uwu
highlight Normal guibg=NONE
highlight Folded guifg=#666666 guibg=#222222
highlight Error guifg=#AA0000 guibg=NONE
highlight TabLine gui=NONE guibg=NONE guifg=#333333
highlight TabLineFill guibg=NONE
highlight TabLineSel guibg=NONE guifg=#ffffff
highlight TabLineSel guibg=NONE guifg=#ffffff
highlight CursorLine guibg=NONE

" Limelight Color
let g:limelight_conceal_guifg = '#777777'

" Enable GUI Colors
set termguicolors

" Disable Status Bar
set laststatus=0

" Set fillchars
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

" Show Dots for Trailing Whitespace
set list
set listchars=tab:\ \ ,trail:\.,

" Hide Cursor Position
set noruler

" Cursor Line
set nocursorline

" Hide Mode
set noshowmode

" SignColumn
sign unplace *
set signcolumn=no

" Fold Styling
set foldtext=FoldText()
function FoldText()
	let indent = repeat(' ', indent(v:foldstart) - 1)
	let nucolwidth = &fdc + &number*&numberwidth
	let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
	let line =  strpart(indent, 0, winwidth(0) - len(foldlinecount))
	return line . "(" . foldlinecount . " lines folded)"
endfunction

" Custom Tab Line With Custom Labels (Shows only file name, no path)
function TabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction

function CustomTabLine()
	let s = ''

	for i in range(tabpagenr('$'))
		" select the highlighting
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif

		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'

		" the label is made by TabLabel()
		let s .= ' %{TabLabel(' . (i + 1) . ')} '
	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let s .= '%=%#TabLine#%999X'
	endif

	return s
endfunction

set tabline=%!CustomTabLine()

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
