local lsp_zero = require('lsp-zero')

lsp_zero.set_sign_icons({
  error = "", warn = "", hint = "󰌶", info = ""
})

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

local on_attach = function(_client, bufnr)
  vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = false } end,
    { silent = true, buffer = bufnr, desc = 'Format' })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { silent = true, buffer = bufnr, desc = 'Rename' })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { silent = true, buffer = bufnr, desc = 'Code action' })

  lsp_zero.default_keymaps({ buffer = bufnr })
end

lsp_zero.on_attach(on_attach)

local lspconfig = require('lspconfig')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "tsserver", "tailwindcss", "cssls", "dockerls", "lua_ls", "rust_analyzer", "yamlls", "jsonls", "graphql", "pyright", "clangd" },
  handlers = {
    lsp_zero.default_setup,
    tsserver = lsp_zero.noop,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      lspconfig.lua_ls.setup(lua_opts)
    end,
    jsonls = function()
      lspconfig.jsonls.setup({
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
    end,
    yamlls = function()
      lspconfig.yamlls.setup({
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
    end,
    cssls = function()
      lspconfig.cssls.setup({
        settings = {
          scss = {
            lint = {
              unknownAtRules = 'ignore' -- for tailwind's @apply rules
            },
          }
        }
      })
    end,
    clangd = function()
      lspconfig.clangd.setup({
        capabilities = {
          -- see https://www.reddit.com/r/neovim/comments/17m7hu2/nvchad_multiple_different_client_offset_encodings/
          offsetEncoding = { "utf-16" },
        },
      })
    end
  }
})


require("typescript-tools").setup { on_attach = on_attach }

local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()
local lspkind = require('lspkind')

require('luasnip.loaders.from_vscode').lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'nvim_lua' }
  },
  mapping = cmp.mapping.preset.insert({
    -- confirm completion item
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- toggle completion menu
    ['<C-e>'] = cmp_action.toggle_completion(),

    -- tab complete
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),

    -- navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- scroll documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-5),
    ['<C-d>'] = cmp.mapping.scroll_docs(5),
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
      maxwidth = 50,
    })
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
})

require("mason-null-ls").setup({
  automatic_installation = true,
  automatic_setup = true,
  ensure_installed = { 'cspell', 'prettierd', 'eslint_d', 'ruff-lsp' },
})

local null_ls = require('null-ls')
local cspell = require('cspell')

local cspell_config = {
  diagnostics_postprocess = function(diagnostic)
    diagnostic.severity = vim.diagnostic.severity["INFO"]
  end,
  config = {
    find_json = function(_)
      return vim.fn.expand("~/.cspell.json")
    end,
  },
}

local eslint_config = {
  condition = function(utils)
    return utils.root_has_file({ ".eslintrc.js", "eslint.config.mjs", ".eslintrc.cjs" })
  end,
}

null_ls.setup({
  sources = {
    cspell.diagnostics.with(cspell_config),
    cspell.code_actions.with(cspell_config),
    require("none-ls.diagnostics.eslint_d").with(eslint_config),
    require("none-ls.formatting.eslint_d").with(eslint_config),
    require("none-ls.code_actions.eslint_d").with(eslint_config),
  }
})

-- Enable format on save
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
