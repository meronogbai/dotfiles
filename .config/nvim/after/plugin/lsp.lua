local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({ "tsserver", "tailwindcss", "cssls", "lua_ls", "rust_analyzer", "yamlls", "jsonls" })

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

local on_attach = function(client, bufnr)
  -- Enable format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format { async = false } end
    })
  end

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = false } end, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

lsp.on_attach(on_attach)

lsp.setup_nvim_cmp({
  formatting = {
    format = require('lspkind').cmp_format({
      with_text = false,
      maxwidth = 50,
    })
  }
})

lsp.skip_server_setup({ 'tsserver' })

lsp.setup()

-- Add extra typescript functionality
require('typescript').setup({
  debug = false,
  server = lsp.build_options('tsserver', {})
})

vim.keymap.set('n', '<leader>rnf', '<cmd>TypescriptRenameFile<CR>')

local null_ls = require('null-ls')
local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
  automatic_installation = true,
  automatic_setup = true,
  ensure_installed = { 'prettierd', 'cspell', 'eslint_d' },
})

mason_null_ls.setup_handlers {
  function(source_name, methods)
    -- all sources with no handler get passed here

    -- To keep the original functionality of `automatic_setup = true`,
    -- please add the below.
    require("mason-null-ls.automatic_setup")(source_name, methods)
  end,
  cspell = function(source_name, methods)
    null_ls.register(null_ls.builtins.diagnostics.cspell.with {
      extra_args = { "--config", "~/.cspell.json" },
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity["INFO"]
      end,
    })
    null_ls.register(null_ls.builtins.code_actions.cspell)
  end,
}

null_ls.setup()

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true
})
