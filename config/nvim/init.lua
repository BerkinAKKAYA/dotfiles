local vim = vim
local api = vim.api
local set = vim.o
local cmp = require'cmp'

set.clipboard = "unnamedplus"
set.tabstop = 4
set.signcolumn = "yes"
set.termguicolors = true
set.mouse = 'a'

api.nvim_command('colorscheme gruvbox')
api.nvim_command('au VimEnter * highlight SignColumn guibg=NONE')
api.nvim_command('au VimEnter * highlight Normal guibg=NONE')
api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank()')

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

-- Setup CMP
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

-- Setup LSP
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150, },
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
end

require'colorizer'.setup()

-- Clear search highlight on press enter
api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', { noremap = true, silent = true })
