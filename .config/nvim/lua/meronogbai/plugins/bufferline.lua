return {
  'akinsho/bufferline.nvim',
  version = "*",
  lazy = false,
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      show_close_icon = false
    },
  },
  keys = {
    { '<Tab>',   '<cmd>BufferLineCycleNext<CR>', desc = 'Go to next buffer' },
    { '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Go to previous buffer' }
  },
  dependencies = 'nvim-tree/nvim-web-devicons'
}
