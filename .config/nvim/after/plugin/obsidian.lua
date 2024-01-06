-- @see https://github.com/epwalsh/obsidian.nvim/issues/286#issuecomment-1877391540
vim.opt_local.conceallevel = 2

require("obsidian").setup({
  -- storing these notes in icloud
  dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes",
  -- mappings = {
  --   -- use gk instead of gk because i need gf to format files
  --   ["gk"] = require("obsidian.mappings").gf_passthrough(),
  -- }
})
