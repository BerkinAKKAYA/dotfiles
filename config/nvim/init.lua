local coq = require("coq")

-- force settings (loadview etc. won't override these)
vim.cmd 'colorscheme material'
vim.cmd 'set tabstop=4'

-- import other config files
vim.cmd 'luafile ~/.config/nvim/lua/mappings.lua'
vim.cmd 'luafile ~/.config/nvim/lua/plugins.lua'

-- add extra commands
vim.cmd "command WW :execute ':silent w !doas tee % > /dev/null' | :edit!"
vim.cmd "command W :execute ':w'"
vim.cmd "command Q :execute ':q'"

-- events
vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'
vim.cmd 'au CursorHold * silent! lua vim.lsp.buf.hover()'
vim.cmd 'au BufWinLeave * silent! mkview'
vim.cmd 'au BufWinEnter * silent! loadview'
vim.cmd 'au BufWritePre *.js,*.vue silent! :Neoformat'
vim.cmd 'au BufWinEnter *.* silent! :COQnow --shut-up'
-- vim.cmd 'au BufWritePre *.* silent! lua vim.lsp.buf.formatting_seq_sync(nil, 200)'

-- Prevent focusing LSP floating window
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { focusable    = false })

-- lsputils
vim.lsp.handlers['textDocument/codeAction']     = require('lsputil.codeAction').code_action_handler
vim.lsp.handlers['textDocument/references']     = require('lsputil.locations').references_handler
vim.lsp.handlers['textDocument/definition']     = require('lsputil.locations').definition_handler
vim.lsp.handlers['textDocument/declaration']    = require('lsputil.locations').declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require('lsputil.locations').typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require('lsputil.locations').implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require('lsputil.symbols').document_handler
vim.lsp.handlers['workspace/symbol']            = require('lsputil.symbols').workspace_handler

-- settings
vim.g.gitblame_date_format = '%r'
vim.g.material_style       = "deep ocean"
vim.g.closetag_filenames   = '*.html,*.blade.php,*.vue'
vim.g.netrw_liststyle      = 3
vim.g.netrw_banner         = 0
vim.g.netrw_browse_split   = 0
vim.g.netrw_winsize        = 25
vim.g.netrw_altv           = 1
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
vim.bo.tabstop             = 4
vim.bo.softtabstop         = 4
vim.bo.shiftwidth          = 4
vim.bo.expandtab           = false
vim.bo.syntax              = 'on'
vim.wo.signcolumn          = 'yes:1'
vim.wo.cursorline          = false
vim.wo.number              = true
vim.wo.relativenumber      = true
vim.wo.wrap                = false
vim.wo.foldexpr            = 'nvim_treesitter#foldexpr()'
vim.wo.foldmethod          = 'expr'
vim.wo.foldnestmax         = 10
vim.wo.foldminlines        = 1
vim.opt.foldtext           = 'v:lua.custom_fold_text()'
vim.opt.fillchars          = { fold = " ", eob = " ", vert = "|", msgsep = " " }

function _G.custom_fold_text()
	local foldstart = vim.fn.getline(vim.v.foldstart)
	local foldend   = string.sub((vim.fn.getline(vim.v.foldend):gsub("^%s*(.-)%s*$", "%1")), 0, 10)
	local indent    = string.rep(" ", vim.fn.indent(vim.v.foldstart) - (vim.fn.indent(vim.v.foldstart) / vim.bo.shiftwidth))
	local result    = indent .. foldstart

	if string.len(foldend) <= 9 then
		return result .. " ... " .. foldend
	else
		return result
	end
end
