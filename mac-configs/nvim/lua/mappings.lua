local map = vim.api.nvim_set_keymap

-- plugins
map('n', 'F', ':HopWord<CR>', {})
-- map('n', '<C-f>', ':Telescope find_files<CR>', {})

-- clear highlights
map('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })

-- find and replace
map('n', '<Space>r', ':s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = true })
map('n', '<Space>R', ':%s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = true })
map('n', 'cn', '*``cgn', {})
map('n', 'cN', '*``cgN', {})

-- lsp
-- map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
-- map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
-- map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
-- map('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
-- map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
-- map('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { noremap = true, silent = true })
-- map('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { noremap = true, silent = true })

-- keep cursor at the center of the screen while searching and joining
map('n', 'n', 'nzzzv', { noremap = true, silent = true })
map('n', 'N', 'Nzzzv', { noremap = true, silent = true })
map('n', 'J', 'mzJ`z', { noremap = true, silent = true })

-- undo breakpoints
map('i', ',', ',<c-g>u', { noremap = true, silent = true })
map('i', '.', '.<c-g>u', { noremap = true, silent = true })
map('i', '!', '!<c-g>u', { noremap = true, silent = true })
map('i', '?', '?<c-g>u', { noremap = true, silent = true })

-- jumplist mutations
map('n', 'k', "v:count > 5 ? \"m'\" . v:count . 'k' : 'k'", { noremap = true, expr = true, silent = true })
map('n', 'j', "v:count > 5 ? \"m'\" . v:count . 'j' : 'j'", { noremap = true, expr = true, silent = true })

-- move lines up and down
map('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
map('i', '<C-j>', "<esc>:m .+1<CR>i", { noremap = true, silent = true })
map('i', '<C-k>', "<esc>:m .-2<CR>i", { noremap = true, silent = true })

-- ctrl+hjkl to navigate splits
map("n", "<c-k>", "<cmd>wincmd k<CR>", { noremap = true })
map("n", "<c-j>", "<cmd>wincmd j<CR>", { noremap = true })
map("n", "<c-h>", "<cmd>wincmd h<CR>", { noremap = true })
map("n", "<c-l>", "<cmd>wincmd l<CR>", { noremap = true })

-- Netrw
map("n", "<C-p>", "<cmd>Lex<CR>", {})
map("n", "<C-t>", "<cmd>tabnew<CR>", {})

-- move between tabs
map("n", "\x15", ":tabnext<CR>", {})
map("n", "\x16", "<cmd>tabprevious<CR>", {})
