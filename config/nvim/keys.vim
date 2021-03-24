" Auto Pairs
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

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
map , :call ToggleComment()<CR>
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
" Force Write As Superuser (:w!!)
cmap w!! w !doas tee > /dev/null %
