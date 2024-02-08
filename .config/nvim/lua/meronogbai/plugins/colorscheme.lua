return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = 'night',
    transparent = true,
    styles = {
      comments = { italic = true }
    }
  },
  init = function()
    vim.cmd [[colorscheme tokyonight]]
  end
}
