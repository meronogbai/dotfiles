require("trouble").setup()

vim.keymap.set('n', '<leader>x', '<cmd>TroubleToggle document_diagnostics<cr>')
vim.keymap.set('n', '<leader>X', '<cmd>TroubleToggle workspace_diagnostics<cr>')
