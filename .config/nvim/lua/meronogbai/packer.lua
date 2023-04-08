vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Shared utils
  use 'nvim-lua/plenary.nvim'

  -- Multi-cursor support with <C-n>
  use 'mg979/vim-visual-multi'

  -- Icons
  use 'nvim-tree/nvim-web-devicons'

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
  use 'jose-elias-alvarez/typescript.nvim'

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

  -- Comment with gc
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Autopairs - useful for html and jsx
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- File explorer
  use 'nvim-tree/nvim-tree.lua'

  -- Bufferline
  use 'akinsho/bufferline.nvim'

  -- Color highlighter for css
  use 'norcalli/nvim-colorizer.lua'

  -- Helps with finding errors
  use 'folke/trouble.nvim'

  -- Git integration
  use 'lewis6991/gitsigns.nvim'
  use 'kdheepak/lazygit.nvim'

  -- Startscreen
  use 'goolord/alpha-nvim'

  -- Github copilot
  use 'github/copilot.vim'
end)
