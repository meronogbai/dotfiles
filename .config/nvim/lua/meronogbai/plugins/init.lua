return {
  -- Shared utils
  'nvim-lua/plenary.nvim',

  -- Icons
  'nvim-tree/nvim-web-devicons',

  -- LSP
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'nvimtools/none-ls.nvim',
  'nvimtools/none-ls-extras.nvim',
  'jayp0521/mason-null-ls.nvim',
  'davidmh/cspell.nvim',

  -- Completions
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',

  -- VSCode like pictograms
  'onsails/lspkind.nvim',

  -- Snippets
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',

  -- Easily setup lsp and cmp
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },

  -- Better TypeScript
  'pmizio/typescript-tools.nvim',

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
