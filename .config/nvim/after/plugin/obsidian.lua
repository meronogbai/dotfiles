require("obsidian").setup({
  -- storing these notes in icloud
  dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes",
  mappings = {
    -- use gk instead of gk because i need gf to format files
    ["gk"] = require("obsidian.mapping").gf_passthrough(),
  }
})
