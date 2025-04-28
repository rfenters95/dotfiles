
-- Copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y')

vim.keymap.set('n', '<leader>Y', '"+yg_')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '"+yy')

-- LSP
vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
vim.keymap.set('n', '<leader><leader>', vim.lsp.omnifunc, { desc = "LSP OmniFunc" })
vim.keymap.set('n', '<leader>csr', vim.lsp.buf.rename, { desc = "LSP Code Symbol Rename" })

-- Paste from clipboard
vim.keymap.set('v', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>P', '"+P')

vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')

-- Telescope
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Telescope help tags' })

-- Treesitter
vim.keymap.set('n', '<leader>i', 'gg=G')

-- Oil
local oil = require("oil")
oil.setup()
vim.keymap.set("n", "o", oil.open, { desc = "Open parent directory" })

