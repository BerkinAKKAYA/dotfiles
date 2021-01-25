" Color Scheme
highlight Normal		guibg=NONE		guifg=#ebdbb2	gui=NONE
highlight TabLine		guibg=NONE		guifg=#6a6a6a	gui=NONE
highlight TabLineSel	guibg=NONE		guifg=#b8bb26	gui=NONE
highlight TabLineFill	guibg=NONE						gui=NONE
highlight Visual		guibg=#595959
highlight Folded		guibg=NONE		guifg=#6a6a6a	gui=NONE
highlight MatchParen	guibg=NONE		guifg=#b8bb26	gui=NONE
highlight CursorLineNr	guibg=NONE		guifg=#fabd2f	gui=NONE
highlight VertSplit		guibg=NONE		guifg=#aaaaaa	gui=NONE
highlight LineNr		guifg=#6a6a6a
highlight Pmenu			guibg=#373737	guifg=#a89984	gui=NONE
highlight PmenuSel		guibg=#665c54	guifg=#fbf1c7	gui=NONE
highlight PmenuSbar		guibg=NONE
highlight PmenuThumb	guibg=NONE
highlight SignColumn	guibg=NONE
highlight Search		guibg=#ebdbb2
highlight link VisualNOS Visual

" Syntax Highlighting
highlight Special		guifg=#fe8019	gui=NONE
highlight Comment		guifg=#6a6a6a	gui=NONE
highlight Todo			guifg=#928374	gui=NONE
highlight Error			guifg=#b8bb26	gui=NONE
highlight Statement		guifg=#98971a	gui=NONE
highlight Repeat		guifg=#b8bb26	gui=NONE
highlight Label			guifg=#b8bb26	gui=NONE
highlight Exception		guifg=#cc241d	gui=NONE
highlight Operator		guifg=#b8bb26	gui=NONE
highlight Keyword		guifg=#8ec07c	gui=NONE
highlight Identifier	guifg=#83a598	gui=NONE
highlight Function		guifg=#b8bb26	gui=NONE
highlight PreProc		guifg=#8ec07c	gui=NONE
highlight Include		guifg=#8ec07c	gui=NONE
highlight Define		guifg=#8ec07c	gui=NONE
highlight Macro			guifg=#8ec07c	gui=NONE
highlight Constant		guifg=#d3869b	gui=NONE
highlight Character		guifg=#d3869b	gui=NONE
highlight String		guifg=#6a6a6a	gui=NONE
highlight Boolean		guifg=#d3869b	gui=NONE
highlight Number		guifg=#d3869b	gui=NONE
highlight Float			guifg=#d3869b	gui=NONE
highlight Type			guifg=#fabd2f	gui=NONE
highlight Structure		guifg=#8ec07c	gui=NONE
highlight Typedef		guifg=#fabd2f	gui=NONE

" Filetype Specific
highlight htmlTag		guifg=#6a6a6a	gui=NONE
highlight htmlEndTag	guifg=#6a6a6a	gui=NONE
highlight htmlTagName	guifg=#fabd2f	gui=BOLD
highlight htmlArg		guifg=#d79921	gui=NONE

" Limelight Color
let g:limelight_conceal_guifg = '#777777'

" Enable GUI Colors
set termguicolors

" Disable Status Bar
set laststatus=0

" Hide Blank Line Tildes And Set Some Other Characters
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

" Hide Cursor Position
set noruler

" Cursor Line
set nocursorline

" Hide Mode
set noshowmode

" Hide SignColumn
sign unplace *
set signcolumn=yes

" Fold Styling
set foldtext=" > "


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
