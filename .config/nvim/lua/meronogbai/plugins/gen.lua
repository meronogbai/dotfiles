return {
  "David-Kunz/gen.nvim",
  opts = {
    model = "codellama",
    display_mode = "split",
    no_auto_close = true,
  },
  keys = {
    { '<leader>]', '<cmd>Gen<CR>', desc = 'Open up Gen', mode = 'v' },
  },
}
