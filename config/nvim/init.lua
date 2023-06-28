-- force settings (loadview etc. won't override these)
vim.cmd 'set tabstop=4'
vim.cmd 'set shiftwidth=4'
vim.cmd 'colorscheme gruvbox'

-- import other config files
vim.cmd 'luafile ~/.config/nvim/mappings.lua'
vim.cmd 'luafile ~/.config/nvim/plugins.lua'

-- -- add extra commands
-- vim.cmd "command WW :execute ':silent w !doas tee % > /dev/null' | :edit!"
-- vim.cmd "command W :execute ':w'"
-- vim.cmd "command Q :execute ':q'"

-- events
vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'
vim.cmd 'au CursorHold * silent! lua vim.lsp.buf.hover()'
vim.cmd 'au BufWinLeave * silent! mkview'
vim.cmd 'au BufWinEnter * silent! loadview'
vim.cmd 'au BufWritePre * silent! Neoformat'
-- vim.cmd 'au BufWritePre *.* silent! lua vim.lsp.buf.formatting_seq_sync(nil, 200)'

-- Prevent focusing LSP floating window
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { focusable    = false })

-- settings
vim.g.loaded_netrw			= 1
vim.g.loaded_netrwPlugin	= 1
vim.g.netrw_liststyle		= 3
vim.g.netrw_banner			= 0
vim.g.netrw_browse_split	= 0
vim.g.netrw_winsize			= 25
vim.g.netrw_altv			= 1
vim.g.gitblame_date_format	= '%r'
vim.g.material_style		= "deep ocean"
vim.g.closetag_filenames	= '*.html,*.blade.php,*.vue'
vim.o.completeopt			= 'menuone,noinsert,noselect'
vim.o.wildmode				= 'list,longest,full'
vim.o.wildmenu				= true
vim.o.clipboard				= 'unnamedplus'
vim.o.termguicolors			= true
vim.o.laststatus			= 0
vim.o.ruler					= false
vim.o.showmode				= false
vim.o.ignorecase			= true
vim.o.updatetime			= 250
vim.o.hidden				= true
vim.o.showcmd				= false
vim.o.scrolloff				= 3
vim.o.lazyredraw			= true
vim.o.background			= "dark"
vim.bo.softtabstop			= 0
vim.bo.expandtab			= false
vim.bo.syntax				= 'on'
vim.bo.autoindent			= true
vim.bo.copyindent			= true
vim.wo.signcolumn			= 'yes:1'
vim.wo.cursorline			= false
vim.wo.number				= true
vim.wo.relativenumber		= false
vim.wo.wrap					= false
vim.wo.foldexpr				= 'nvim_treesitter#foldexpr()'
vim.wo.foldmethod			= 'expr'
vim.wo.foldnestmax			= 3
vim.wo.foldminlines			= 1
vim.opt.fillchars			= { fold = " ", eob = " ", vert = "|", msgsep = " " }
vim.wo.foldtext				= [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]

vim.g.gitblame_message_template = '    <date> • <author>'
vim.g.neo_tree_remove_legacy_commands = 1
vim.g.neoformat_try_node_exe = 1
