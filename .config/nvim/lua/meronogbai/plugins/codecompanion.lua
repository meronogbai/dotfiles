return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
        model = "claude-sonnet-4-20250514",
      },
      inline = {
        adapter = "anthropic",
        model = "claude-sonnet-4-20250514",
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
