return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
      },
      inline = {
        adapter = "anthropic",
      },
    },
  },
  keys = {
    {
      "<leader>at",
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "Toggle Chat",
      mode = { "n", "v" }
    },
    {
      "<leader>ao",
      "<cmd>CodeCompanionChat<cr>",
      desc = "Toggle Chat",
      mode = { "n", "v" }
    }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
