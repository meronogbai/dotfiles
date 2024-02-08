return {
  "folke/trouble.nvim",
  keys = {
    { '<leader>x', '<cmd>TroubleToggle document_diagnostics<cr>',  desc = 'Open trouble' },
    { '<leader>X', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Close trouble' }
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
