require("obsidian").setup({
  ui = {
    enable = false,
  },
  -- storing these notes in icloud
  dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes",
  mappings = {
    -- use gk instead of gk because i need gf to format files
    ["gk"] = require("obsidian.mappings").gf_passthrough(),
    -- Toggle check-boxes.
    ["<leader>ch"] = {
      action = function()
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
  }
})
