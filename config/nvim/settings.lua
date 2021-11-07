vim.g.gitblame_date_format = '%r'
vim.g.material_style = "deep ocean"
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.wildmode = 'list,longest,full'
vim.o.wildmenu = true
vim.o.clipboard = 'unnamedplus'
vim.o.termguicolors = true
vim.o.laststatus = 0
vim.o.mouse = 'a'
vim.o.ruler = false
vim.o.showmode = false
vim.o.ignorecase = true
vim.o.updatetime = 250
vim.o.hidden = true
vim.o.fillchars = "fold: ,vert:│,eob: ,msgsep:‾"
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.showcmd = false
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.syntax = 'on'
vim.bo.expandtab = false
vim.wo.signcolumn = 'yes:1'
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldmethod = 'expr'
vim.wo.foldnestmax = 10
vim.wo.foldminlines = 1
vim.opt.foldtext = 'v:lua.custom_fold_text()'

vim.cmd 'colorscheme material'

function _G.custom_fold_text()
	local foldstart = vim.fn.getline(vim.v.foldstart)
	local foldend = string.sub((vim.fn.getline(vim.v.foldend):gsub("^%s*(.-)%s*$", "%1")), 0, 10)
	local indent = string.rep(" ", vim.fn.indent(vim.v.foldstart) - 1)
	local result = indent .. foldstart

	if string.len(foldend) <= 3 then
		return result .. " ... " .. foldend
	else
		return result
	end
end
