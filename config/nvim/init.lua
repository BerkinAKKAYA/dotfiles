local vim = vim
local api = vim.api
local cmp = require('cmp')

vim.g.gitblame_date_format = '%r'

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
vim.bo.shiftwidth = 4
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

api.nvim_command('au BufWinEnter * set tabstop=4')
api.nvim_command('colorscheme sonokai')

api.nvim_command("command WW :execute ':silent w !doas tee % > /dev/null' | :edit!")
api.nvim_command("command W :execute ':w'")
api.nvim_command("command Q :execute ':q'")

api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank()')
api.nvim_command('au CursorHold * silent! lua vim.lsp.buf.hover()')
-- api.nvim_command('au BufWinLeave * mkview')
-- api.nvim_command('au BufWinEnter * silent! loadview')
api.nvim_command('au BufWritePre *.* lua vim.lsp.buf.formatting_sync(nil, 200)')
api.nvim_command('au VimEnter * highlight HopNextKey  guibg=#ff0000 guifg=#ffffff')
api.nvim_command('au VimEnter * highlight HopNextKey1 guibg=#ff0000 guifg=#ffffff')
api.nvim_command('au VimEnter * highlight HopNextKey2 guibg=#ff0000 guifg=#ffffff')
api.nvim_command('au VimEnter * highlight HopNextKey2 guibg=#ff0000 guifg=#ffffff')
api.nvim_command('au VimEnter * highlight TabLine guifg=#666666')

local removeBackgroundOf = { 'Normal', 'EndOfbuffer', 'SignColumn', 'Folded', 'TabLine', 'TabLineFill', 'TabLineSel', 'LineNr' }
for _, item in ipairs(removeBackgroundOf) do
	api.nvim_command('au VimEnter * highlight ' .. item .. ' gui=NONE guibg=NONE')
end

require 'paq' {
	'savq/paq-nvim';

	-- helpers
	'nvim-lua/plenary.nvim';
	'winston0410/cmd-parser.nvim';
	'nvim-lua/popup.nvim'; -- for telescope

	-- appearance
	'sainnhe/sonokai';
	'kyazdani42/nvim-web-devicons';

	-- tools
	'blackCauldron7/surround.nvim';
	'norcalli/nvim-colorizer.lua';
	'phaazon/hop.nvim';
	'kyazdani42/nvim-tree.lua';
	'winston0410/range-highlight.nvim';
	'terrortylor/nvim-comment';
	'AckslD/nvim-neoclip.lua';
	'nvim-telescope/telescope.nvim';
	'airblade/vim-rooter';

	-- languages
	'posva/vim-vue';

	-- programming
	'windwp/nvim-ts-autotag';
	'nvim-treesitter/nvim-treesitter';

	-- lsp
	'neovim/nvim-lspconfig';
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-buffer';
	'hrsh7th/nvim-cmp';
	'L3MON4D3/LuaSnip';
	'saadparwaiz1/cmp_luasnip';
	'RishabhRD/popfix'; -- for lsputils
	'RishabhRD/nvim-lsputils';

	-- git integration
	'f-person/git-blame.nvim';
	'lewis6991/gitsigns.nvim';
}

-- Setup LSP
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'cssls', 'vuels', 'sumneko_lua' }
for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup {
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}
end

require('colorizer').setup({ '*' }, { rgb_fn = true })
require('surround').setup({ mappings_style = 'surround' })
require('hop.highlight').insert_highlights()
require('nvim-treesitter.configs').setup({ ensure_installed = "maintained", })
require('nvim-ts-autotag').setup()
require('range-highlight').setup()
require('nvim-web-devicons').setup({ default = true; })
require('nvim_comment').setup()
require('nvim-tree').setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = true,
	auto_close = true,
	open_on_tab = true,
	hijack_cursor = true,
	update_cwd = true,
	update_to_buf_dir = { enable = true, auto_open = true },
	update_focused_file = { enable = true, update_cwd  = true },
	view = { auto_resize = true }
})
require('neoclip').setup()
require('telescope').setup()
require('gitsigns').setup({
	signs = {
		add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
		change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		topdelete    = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
	},
	preview_config = {
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
})

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
	}
})

api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Space>r', ':s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Space>R', ':%s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'F', ':HopWord<CR>', {})
api.nvim_set_keymap('n', '<C-i>', ':NvimTreeToggle<CR>', {})
api.nvim_set_keymap('n', '<C-f>', ':Telescope git_files<CR>', {})
api.nvim_set_keymap('n', '<C-p>', ':Telescope neoclip a extra=star,plus,b<CR>', {})

api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { noremap = true, silent = true })

-- Prevent focusing LSP floating window
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { focusable = false })

-- lsputils configuration
vim.lsp.handlers['textDocument/codeAction'] = require('lsputil.codeAction').code_action_handler
vim.lsp.handlers['textDocument/references'] = require('lsputil.locations').references_handler
vim.lsp.handlers['textDocument/definition'] = require('lsputil.locations').definition_handler
vim.lsp.handlers['textDocument/declaration'] = require('lsputil.locations').declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require('lsputil.locations').typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require('lsputil.locations').implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require('lsputil.symbols').document_handler
vim.lsp.handlers['workspace/symbol'] = require('lsputil.symbols').workspace_handler

function _G.custom_fold_text()
	local foldstart = vim.fn.getline(vim.v.foldstart)
	local foldend = string.sub(trim(vim.fn.getline(vim.v.foldend)), 0, 10)

	if string.len(foldend) <= 3 then
		return foldstart .. " ... " .. foldend
	else
		return foldstart
	end
end
function trim(s)
	return s:gsub("^%s*(.-)%s*$", "%1")
end
