vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Shared utils
  use 'nvim-lua/plenary.nvim'

  -- Multi-cursor support with <C-n>
  use 'mg979/vim-visual-multi'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Statusline
  use 'nvim-lualine/lualine.nvim'

  -- Colorscheme
  use 'folke/tokyonight.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jayp0521/mason-null-ls.nvim'

  -- Completions
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  -- VSCode like pictograms
  use 'onsails/lspkind.nvim'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Easily setup lsp and cmp
  use 'VonHeikemen/lsp-zero.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Comment with gc
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'nvim-tree/nvim-tree.lua'

  use 'akinsho/bufferline.nvim'
  use 'norcalli/nvim-colorizer.lua'

  use 'folke/trouble.nvim'
  use 'lewis6991/gitsigns.nvim'
end)
