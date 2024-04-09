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
  'jayp0521/mason-null-ls.nvim',
  'davidmh/cspell.nvim',

  -- DAP
  'mfussenegger/nvim-dap',
  { 'rcarriga/nvim-dap-ui',      dependencies = { 'nvim-neotest/nvim-nio' } },
  'theHamsta/nvim-dap-virtual-text',

  -- JS/TS Debugging
  'mxsdev/nvim-dap-vscode-js',

  {
    'microsoft/vscode-js-debug',
    lazy = true,
    -- builds a copy of vscode-js-debug
    build =
    'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && rm -rf out && mv dist out && git restore package-lock.json'
  },

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
