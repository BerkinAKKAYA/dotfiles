local coq = require("coq")

-- force settings (loadview etc. won't override these)
vim.cmd 'colorscheme material'
vim.cmd 'set tabstop=4'

-- import other config files
-- vim.cmd 'luafile ~/.config/nvim/lua/settings.lua'
vim.cmd 'luafile ~/.config/nvim/lua/mappings.lua'

require 'paq' {
	'savq/paq-nvim';

	-- helpers
	'nvim-lua/plenary.nvim';
	'winston0410/cmd-parser.nvim';
	'nvim-lua/popup.nvim'; -- for telescope
	'RishabhRD/popfix'; -- for lsputils

	-- appearance
	'marko-cerovac/material.nvim';
	'kyazdani42/nvim-web-devicons';
	'alvarosevilla95/luatab.nvim';

	-- tools
	'blackCauldron7/surround.nvim';
	'norcalli/nvim-colorizer.lua';
	'phaazon/hop.nvim';
	'winston0410/range-highlight.nvim';
	'terrortylor/nvim-comment';
	'nvim-telescope/telescope.nvim';
	'airblade/vim-rooter';
	'lumiliet/vim-twig'; -- autoindent
	'jiangmiao/auto-pairs';
	'alvan/vim-closetag';
	'godlygeek/tabular';

	-- programming
	'nvim-treesitter/nvim-treesitter';
	'neovim/nvim-lspconfig';
	'ms-jpq/coq_nvim';
	'ms-jpq/coq.artifacts';
	'jwalton512/vim-blade';
	'sbdchd/neoformat';
	'RishabhRD/nvim-lsputils';

	-- git integration
	'f-person/git-blame.nvim';
	'lewis6991/gitsigns.nvim';
}

vim.api.nvim_command("command WW :execute ':silent w !doas tee % > /dev/null' | :edit!")
vim.api.nvim_command("command W :execute ':w'")
vim.api.nvim_command("command Q :execute ':q'")

vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank()')
vim.api.nvim_command('au CursorHold * silent! lua vim.lsp.buf.hover()')
vim.api.nvim_command('au BufWinLeave * silent! mkview')
vim.api.nvim_command('au BufWinEnter * silent! loadview')
-- vim.api.nvim_command('au BufWritePre *.* silent! lua vim.lsp.buf.formatting_seq_sync(nil, 200)')
vim.api.nvim_command('au BufWritePre *.js,*.vue silent! :Neoformat')
vim.api.nvim_command('au BufWinEnter *.* silent! :COQnow --shut-up')

-- setup lsp
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'cssls' }
for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup(coq.lsp_ensure_capabilities())
end
require('lspconfig').volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

-- setup plugins
require('colorizer').setup({ '*' }, { rgb_fn = true })
require('surround').setup({ mappings_style = 'surround' })
require('hop').setup()
require('nvim-treesitter.configs').setup({ ensure_installed = "maintained" })
require('range-highlight').setup()
require('nvim-web-devicons').setup({ default = true; })
require('nvim_comment').setup()
require('luatab').setup{}
require('telescope').setup({ defaults = { file_ignore_patterns = { "node_modules" } } })
require('gitsigns').setup({
	signs = {
		add          = {hl = 'GitSignsAdd'   , text = '+', numhl = 'GitSignsAddNr'   , linehl = 'GitSignsAddLn'   },
		change       = {hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'},
		changedelete = {hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'},
		delete       = {hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'},
		topdelete    = {hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'},
	},
	preview_config = {
		border   = 'single',
		style    = 'minimal',
		relative = 'cursor',
		row      = 0,
		col      = 1
	},
})
require('material').setup({
	contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
	borders  = false, -- Enable borders between verticaly split windows

	popup_menu = "colorful", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )

	italics = {
		comments  = true, -- Enable italic comments
		keywords  = true, -- Enable italic keywords
		functions = true, -- Enable italic functions
		strings   = true, -- Enable italic strings
		variables = true -- Enable italic variables
	},

	text_contrast = {
		lighter = true, -- Enable higher contrast text for lighter style
		darker  = true -- Enable higher contrast text for darker style
	},

	disable = {
		background  = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines   = true -- Hide the end-of-buffer lines
	},

	custom_highlights = {
		CursorLine = '#0000FF',
		LineNr     = '#FF0000'
	}
})

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
