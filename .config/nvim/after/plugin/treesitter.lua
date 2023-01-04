require('nvim-treesitter.configs').setup {
  ensure_installed = { "rust", "tsx", "lua", "json", "css" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_higlighting = false
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  }
}