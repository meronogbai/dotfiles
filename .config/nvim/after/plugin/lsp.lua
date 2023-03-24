local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({ "tsserver", "tailwindcss", "cssls", "lua_ls", "rust_analyzer", "eslint", "yamlls", "jsonls" })

lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
})

lsp.configure('jsonls', {
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      -- Schemas https://www.schemastore.org
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json"
        },
        {
          fileMatch = { "tsconfig*.json" },
          url = "https://json.schemastore.org/tsconfig.json"
        },
        {
          fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json"
          },
          url = "https://json.schemastore.org/prettierrc.json"
        },
        {
          fileMatch = { ".eslintrc", ".eslintrc.json" },
          url = "https://json.schemastore.org/eslintrc.json"
        },
      }
    }
  }
})

lsp.configure('yamlls', {
  settings = {
    yaml = {
      -- Schemas https://www.schemastore.org
      schemas = {
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
          "docker-compose*.{yml,yaml}"
        },
        ["http://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
        ["http://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc.json"] = ".prettierrc.{yml,yaml}",
      }
    }
  }
})

lsp.set_preferences({
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

  vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = false } end, { buffer = bufnr })
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
