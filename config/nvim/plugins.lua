local cmp = require('cmp')

require 'paq' {
	'savq/paq-nvim';

	-- helpers
	'nvim-lua/plenary.nvim';
	'winston0410/cmd-parser.nvim';
	'nvim-lua/popup.nvim'; -- for telescope

	-- appearance
	'marko-cerovac/material.nvim';
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
	'weilbith/nvim-code-action-menu';

	-- git integration
	'f-person/git-blame.nvim';
	'lewis6991/gitsigns.nvim';
}

-- Setup LSP
local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'cssls', 'vuels' }
for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup {
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}
end

require('colorizer').setup({ '*' }, { rgb_fn = true })
require('surround').setup({ mappings_style = 'surround' })
require('hop.highlight').insert_highlights()
require('nvim-treesitter.configs').setup({ ensure_installed = "maintained" })
require('nvim-ts-autotag').setup()
require('range-highlight').setup()
require('nvim-web-devicons').setup({ default = true; })
require('nvim_comment').setup()
require('neoclip').setup()
require('telescope').setup()
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
require('material').setup({
	contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
	borders = false, -- Enable borders between verticaly split windows

	popup_menu = "colorful", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )

	italics = {
		comments = true, -- Enable italic comments
		keywords = true, -- Enable italic keywords
		functions = true, -- Enable italic functions
		strings = true, -- Enable italic strings
		variables = true -- Enable italic variables
	},

	text_contrast = {
		lighter = true, -- Enable higher contrast text for lighter style
		darker = true -- Enable higher contrast text for darker style
	},

	disable = {
		background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false -- Hide the end-of-buffer lines
	},

	custom_highlights = {
		CursorLine = '#0000FF',
		LineNr = '#FF0000'
	}
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
