vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Shared utils
  use 'nvim-lua/plenary.nvim'

  -- Icons
  use 'nvim-tree/nvim-web-devicons'

  -- Colorscheme
  use 'folke/tokyonight.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'nvimtools/none-ls.nvim'
  use 'jayp0521/mason-null-ls.nvim'

  -- DAP
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  -- JS/TS Debugging
  use 'mxsdev/nvim-dap-vscode-js'
  use {
    'microsoft/vscode-js-debug',
    opt = true,
    -- builds a copy of vscode-js-debug
    run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && rm -rf out && mv dist out && git restore package-lock.json'
  }

  -- Completions
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  -- VSCode like pictograms
  use 'onsails/lspkind.nvim'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- Easily setup lsp and cmp
  use({ 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' })

  -- Better TypeScript
  use 'pmizio/typescript-tools.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Folds
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

  -- Autopairs - useful for html and jsx
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Git integration
  use 'lewis6991/gitsigns.nvim'
  use 'kdheepak/lazygit.nvim'

  -- tmux integration
  use 'christoomey/vim-tmux-navigator'

  -- Comment with gc
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Multi-cursor support with <C-n>
  use 'mg979/vim-visual-multi'

  -- Statusline
  use 'nvim-lualine/lualine.nvim'

  -- File explorer
  use 'nvim-tree/nvim-tree.lua'
  use "stevearc/oil.nvim"

  -- Replace netrw's gx
  use 'chrishrb/gx.nvim'

  -- Bufferline
  use 'akinsho/bufferline.nvim'

  -- Helps with finding errors
  use 'folke/trouble.nvim'

  -- Colorizer
  use 'NvChad/nvim-colorizer.lua'
  -- Startscreen
  use 'goolord/alpha-nvim'

  -- Surround
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  })

  -- Note taking with obsidian
  use "epwalsh/obsidian.nvim"

  -- Markdown preview
  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }
end)
