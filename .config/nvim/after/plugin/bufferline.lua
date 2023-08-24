require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    show_close_icon = false
  },
}

vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Go to previous buffer' })
