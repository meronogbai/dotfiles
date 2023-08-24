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
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jayp0521/mason-null-ls.nvim'

  -- DAP
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'jay-babu/mason-nvim-dap.nvim'

  -- Completions
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'

  -- VSCode like pictograms
  use 'onsails/lspkind.nvim'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- Easily setup lsp and cmp
  use 'VonHeikemen/lsp-zero.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-context'

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

  -- Bufferline
  use 'akinsho/bufferline.nvim'

  -- Helps with finding errors
  use 'folke/trouble.nvim'

  -- Colors
  use 'norcalli/nvim-colorizer.lua'
  use 'themaxmarchuk/tailwindcss-colors.nvim'

  -- Startscreen
  use 'goolord/alpha-nvim'

  -- Surround
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  })
end)
