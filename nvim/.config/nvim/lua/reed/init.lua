vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup("reed.plugins")

-- vim.cmd[[colorscheme tokyonight-night]]
-- vim.cmd[[colorscheme tokyonight-storm]]
-- vim.cmd[[colorscheme tokyonight-day]]
-- vim.cmd[[colorscheme tokyonight-moon]]
vim.cmd.colorscheme "catppuccin-mocha"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.mouse = 'a'

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- General
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y')

vim.keymap.set('n', '<leader>Y', '"+yg_')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '"+yy')

-- LSP
vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, { desc = 'LSP Code Action' })
vim.keymap.set('i', '<C-.>', vim.lsp.omnifunc, { desc = 'LSP OmniFunc' })

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
