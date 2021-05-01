" Move between windows via CTRL+{HJKL}
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Resize windows via ALT+{HJKL}
map <M-h>	:vertical resize -2<CR>
map <M-j>	:horizontal resize -2<CR>
map <M-k>	:horizontal resize +2<CR>
map <M-l>	:vertical resize +2<CR>

" Move between tabs
map <PageUp> :tabprevious<CR>
map <PageDown> :tabnext<CR>

" Seek up via CTRL+Q
map <C-q> <C-y>

" Comment / Uncomment via Comma
map , :call ToggleComment()<CR>
" Open a New Empty Tab And Call File Opener
map <C-t> :tabnew<CR><C-o>
" Open new file adjacent to current file
map <C-o> :edit! <C-R>=expand("%:p:h") . "/" <CR>
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
command W :execute ':silent w !doas tee % > /dev/null' | :edit!
