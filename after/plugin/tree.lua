local api = require "nvim-tree.api"

vim.keymap.set('n', '<C-q>', api.tree.open)
vim.keymap.set('n', '<leader>q', api.tree.toggle)
