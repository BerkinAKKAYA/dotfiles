" Move between windows via CTRL+{HJKL}
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Move between tabs
map <PageUp> :tabprevious<CR>
map <PageDown> :tabnext<CR>

" Resize windows via ALT+{HJKL}
nnoremap <M-h>	:vertical resize -2<CR>
nnoremap <M-j>	:horizontal resize -2<CR>
nnoremap <M-k>	:horizontal resize +2<CR>
nnoremap <M-l>	:vertical resize +2<CR>

" Seek Up Via CTRL+q (Down is CTRL+e and Up by CTRL+y by Default)
map <C-q> <C-y>

" Comment / Uncomment via Comma
map , <plug>NERDCommenterToggle
" Open Up FZF Line Finder
map <C-f> :BLines<CR>
" Open Up FZF File Finder
map <C-y> :Files<CR>
" Open a New Empty Tab
map <C-t> :tabnew<CR>
" Open new file adjacent to current file
map <C-o> :edit <C-R>=expand("%:p:h") . "/" <CR>
" Replace All (in line)
map <Space>r :s/<C-r><C-w>//g<Left><Left>
" Replace All (in document)
map <Space>R :%s/<C-r><C-w>//g<Left><Left>
" Fold & Unfold All
map <expr> <Space>F &foldlevel ? 'zM' :'zR'
" Toggle Folds
map <Space><Space> za
" Toggle Limelight
map <Space>l :Limelight!!<CR>
" Toggle Colorizer
map <Space>c :ColorizerToggle<CR>
" Save via CTRL+S
map <C-s> :w<CR>
" Force Write As Superuser (:w!!)
cmap w!! w !sudo tee > /dev/null %

" Multiple Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
