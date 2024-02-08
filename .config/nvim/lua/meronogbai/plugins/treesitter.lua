return {
  {
   'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
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
      }
    end,
    dependencies = { 'windwp/nvim-ts-autotag' }
  },
  { 'nvim-treesitter/nvim-treesitter-context', config = true }
}
