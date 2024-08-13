return {
  -- Shared utils
  'nvim-lua/plenary.nvim',

  -- Icons
  'nvim-tree/nvim-web-devicons',

  -- tmux integration
  'christoomey/vim-tmux-navigator',

  -- Multi-cursor support with <C-n>
  'mg979/vim-visual-multi',

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
