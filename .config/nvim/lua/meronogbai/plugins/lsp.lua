return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'nvimtools/none-ls.nvim',
      'nvimtools/none-ls-extras.nvim',
      'jayp0521/mason-null-ls.nvim',
      'davidmh/cspell.nvim',

      -- Completions
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- VSCode like pictograms
      'onsails/lspkind.nvim',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',

      -- Better TypeScript
      'pmizio/typescript-tools.nvim',
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      local lspconfig = require('lspconfig')
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      local null_ls = require('null-ls')
      local cspell = require('cspell')

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
          source = true,
          header = '',
          prefix = '',
        }
      })

      local on_attach = function(_client, bufnr)
        vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = false } end,
          { silent = true, buffer = bufnr, desc = 'Format' })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { silent = true, buffer = bufnr, desc = 'Rename' })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
          { silent = true, buffer = bufnr, desc = 'Code action' })

        lsp_zero.default_keymaps({ buffer = bufnr })
      end

      lsp_zero.on_attach(on_attach)

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { "ts_ls", "tailwindcss", "cssls", "dockerls", "lua_ls", "rust_analyzer", "yamlls", "jsonls", "graphql", "pyright", "clangd", "gopls" },
        handlers = {
          lsp_zero.default_setup,
          ts_ls = lsp_zero.noop,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            lspconfig.lua_ls.setup(lua_opts)
          end,
          -- Schemas https://www.schemastore.org
          jsonls = function()
            lspconfig.jsonls.setup({
              filetypes = { "json", "jsonc" },
              settings = {
                json = {
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
              -- for tailwind's @apply rules
              settings = {
                scss = {
                  lint = {
                    unknownAtRules = 'ignore'
                  },
                },
                css = {
                  lint = {
                    unknownAtRules = 'ignore'
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

      local cmp_action = lsp_zero.cmp_action()

      require('luasnip.loaders.from_vscode').lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load()

      vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'luasnip' },
          { name = 'nvim_lua' }
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<C-e>'] = cmp_action.toggle_completion(),
          ['<Tab>'] = cmp_action.tab_complete(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
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

      -- Setup vim-dadbod
      cmp.setup.filetype({ 'sql', 'mysql', 'plsql' }, {
        sources = {
          { name = 'vim-dadbod-completion' },
          { name = 'buffer' }
        }
      })

      require("mason-null-ls").setup({
        automatic_installation = true,
        automatic_setup = true,
        ensure_installed = { 'cspell', 'prettierd', 'eslint_d', 'ruff-lsp', 'terraform-ls' },
      })

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
          return utils.root_has_file({ ".eslintrc.js", "eslint.config.mjs", ".eslintrc.cjs", ".eslintrc.json" })
        end,
      }

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettierd,
          cspell.diagnostics.with(cspell_config),
          cspell.code_actions.with(cspell_config),
          require("none-ls.diagnostics.eslint_d").with(eslint_config),
          require("none-ls.formatting.eslint_d").with(eslint_config),
          require("none-ls.code_actions.eslint_d").with(eslint_config),
        }
      })

      -- Enable format on save
      vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
    end
  }
}
