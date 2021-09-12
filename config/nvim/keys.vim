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
nmap <PageDown> :tabnext<CR>
nmap <PageUp> :tabprevious<CR>

" Comment / Uncomment via Comma
nmap , :call ToggleComment()<CR>
" Open a New Empty Tab And Call File Opener
nmap <C-t> :tabnew<CR><C-o>
" Open new file adjacent to current file
" nmap <C-o> :edit! <C-R>=expand("%:p:h") . "/" <CR>
" Replace All (in line)
nmap <Space>r :s/<C-r><C-w>//g<Left><Left>
" Replace All (in document)
nmap <Space>R :%s/<C-r><C-w>//g<Left><Left>
" Fold & Unfold All
nmap <expr> F &foldlevel ? 'zM' :'zR'
" Fold & Unfold One
nmap <Space><Space> za
" Toggle Limelight
nmap <Space>l :Limelight!!<CR>
" Force Write As Superuser (:w!!)
command WW :execute ':silent w !doas tee % > /dev/null' | :edit!
" Prevent Misclicks
command W :execute ':w'
command Q :execute ':q'

" Search & Find
nmap <C-o> :Files <CR>
nmap <C-f> :Rg <CR>

" Spellchecker
vmap <Space>a <Plug>(coc-codeaction-selected)<CR>
nmap <Space>a <Plug>(coc-codeaction-selected)<CR>

" CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <Space>do <Plug>(coc-codeaction)
nmap <Space>rn <Plug>(coc-rename)
