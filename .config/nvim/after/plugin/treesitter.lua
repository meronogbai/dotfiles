require('nvim-treesitter.configs').setup {
  ensure_installed = { "rust", "tsx", "lua", "json", "css", "markdown", "markdown_inline" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_higlighting = { 'markdown' }
  },
  autotag = {
    enable = true,
    -- @see https://github.com/windwp/nvim-ts-autotag/issues/125
    enable_close_on_slash = false,
  },
  context_commentstring = {
    enable = true
  }
}

require('treesitter-context').setup()
