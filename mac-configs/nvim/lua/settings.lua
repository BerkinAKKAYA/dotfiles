-- force settings (loadview etc. won't override these)
vim.cmd 'set tabstop=4'

-- add extra commands
vim.cmd "command WW :execute ':silent w !doas tee % > /dev/null' | :edit!"
vim.cmd "command W :execute ':w'"
vim.cmd "command Q :execute ':q'"

-- events
vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'
vim.cmd 'au BufWinLeave * silent! mkview'
vim.cmd 'au BufWinEnter * silent! loadview'
-- vim.cmd 'au BufWritePre *.js,*.vue silent! :Neoformat'
-- vim.cmd 'au BufWinEnter *.* silent! :COQnow --shut-up'
-- vim.cmd 'au CursorHold * silent! lua vim.lsp.buf.hover()'
-- vim.cmd 'au BufWritePre *.* silent! lua vim.lsp.buf.formatting_seq_sync(nil, 200)'

-- color scheme
vim.cmd 'colorscheme ayu'

-- gitblame
vim.g.gitblame_date_format = '%r'
vim.g.gitblame_date_format = '%r'

-- netrw
vim.g.netrw_liststyle      = 3
vim.g.netrw_banner         = 0
vim.g.netrw_browse_split   = 0
vim.g.netrw_winsize        = 25
vim.g.netrw_altv           = 1

-- built-in defaults
vim.o.completeopt          = 'menuone,noinsert,noselect'
vim.o.wildmode             = 'list,longest,full'
vim.o.wildmenu             = true
vim.o.clipboard            = 'unnamedplus'
vim.o.termguicolors        = true
vim.o.laststatus           = 0
vim.o.mouse                = 'a'
vim.o.ruler                = false
vim.o.showmode             = false
vim.o.ignorecase           = true
vim.o.updatetime           = 250
vim.o.hidden               = true
vim.o.showcmd              = false
vim.o.scrolloff            = 3
vim.o.lazyredraw           = true

-- built-in buffer
vim.bo.tabstop             = 4
vim.bo.softtabstop         = 4
vim.bo.shiftwidth          = 4
vim.bo.expandtab           = false
vim.bo.syntax              = 'on'

-- build-in window
vim.wo.signcolumn          = 'yes:1'
vim.wo.cursorline          = false
vim.wo.number              = true
vim.wo.relativenumber      = true
vim.wo.wrap                = false
vim.wo.foldexpr            = 'nvim_treesitter#foldexpr()'
vim.wo.foldmethod          = 'expr'
vim.wo.foldnestmax         = 10
vim.wo.foldminlines        = 1

-- fold options
vim.opt.foldtext           = 'v:lua.custom_fold_text()'
vim.opt.fillchars          = { fold = " ", eob = " ", vert = "|", msgsep = " " }
