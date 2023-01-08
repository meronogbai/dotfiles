local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({ "tsserver", "tailwindcss", "cssls", "sumneko_lua", "rust_analyzer", "eslint" })

lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
})

lsp.set_preferences({
  set_lsp_keymaps = false,
  sign_icons = { error = "", warn = "", hint = "", info = "" },
})

lsp.on_attach(function(client, bufnr)
  -- Enable format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format { async = false } end
    })
  end

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = false } end, bufopts)
end)

lsp.setup_nvim_cmp({
  formatting = {
    format = require('lspkind').cmp_format({
      with_text = false,
      maxwidth = 50,
    })
  }
})

lsp.setup()

local null_ls = require('null-ls')
local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
  automatic_installation = true,
  automatic_setup = true,
  ensure_installed = { 'prettierd', 'cspell' },
})

mason_null_ls.setup_handlers({})

null_ls.setup({
  fallback_severity = vim.diagnostic.severity.INFO,
})
