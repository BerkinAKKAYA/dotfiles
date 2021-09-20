local vim = vim
local cmd = vim.cmd
local cmp = require'cmp'

vim.o.clipboard = "unnamedplus"
vim.o.tabstop = 4
vim.o.signcolumn = "yes"
vim.o.termguicolors = true

cmd 'colorscheme gruvbox'
cmd 'au VimEnter * highlight SignColumn guibg=NONE'
cmd 'au VimEnter * highlight Normal guibg=NONE'

require "paq" {
	"savq/paq-nvim";

	"neovim/nvim-lspconfig";
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-buffer';
	'hrsh7th/nvim-cmp';
	'L3MON4D3/LuaSnip';

	'morhetz/gruvbox';
	'norcalli/nvim-colorizer.lua';
}

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
    },
    mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
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

require'lspconfig'.pyright.setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'colorizer'.setup()
