local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({ "tsserver", "tailwindcss", "cssls", "lua_ls", "rust_analyzer", "yamlls", "jsonls" })

lsp.skip_server_setup({ 'tsserver' })

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

lsp.configure('cssls', {
  settings = {
    scss = {
      lint = {
        unknownAtRules = 'ignore' -- for tailwind's @apply rules
      },
    }
  }
})

lsp.set_preferences({
  sign_icons = { error = "", warn = "", hint = "󰌶", info = "" },
})

local on_attach = function(_client, bufnr)
  vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = false } end,
    { silent = true, buffer = bufnr, desc = 'Format' })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { silent = true, buffer = bufnr, desc = 'Rename' })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { silent = true, buffer = bufnr, desc = 'Code action' })
end

lsp.on_attach(on_attach)

lsp.setup()

require("typescript-tools").setup { on_attach = on_attach }

local cmp = require('cmp')
local lspkind = require('lspkind')

require('luasnip.loaders.from_vscode').lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'nvim_lua' }
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
      maxwidth = 50,
    })
  },
  mapping = lsp.defaults.cmp_mappings({
    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})

local null_ls = require('null-ls')
local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
  automatic_installation = true,
  automatic_setup = true,
  ensure_installed = { 'cspell', 'prettierd', 'eslintd' },
  handlers = {
    cspell = function()
      null_ls.register(null_ls.builtins.diagnostics.cspell.with {
        extra_args = { "--config", "~/.cspell.json" },
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = vim.diagnostic.severity["INFO"]
        end,
      })
      null_ls.register(null_ls.builtins.code_actions.cspell)
    end,
  }
})

null_ls.setup()

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true,
  float = {
    focusable = true,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  }
})

-- Enable format on save
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
