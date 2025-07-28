return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP Support
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
      local lspconfig = require('lspconfig')
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      local null_ls = require('null-ls')
      local cspell = require('cspell')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Configure diagnostic and hover window appearance
      local float_config = {
        focusable = true,
        style = 'minimal',
        border = 'rounded',
        source = true,
        header = '',
        prefix = '',
      }

      vim.diagnostic.config({
        virtual_text = true,
        update_in_insert = true,
        float = float_config,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌶",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
      })

      local on_attach = function(_client, bufnr)
        local opts = { silent = true, buffer = bufnr, noremap = true }
        vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = false } end, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set({ 'n', 'v' }, '<F4>', vim.lsp.buf.code_action, opts)

        local function diagnostic_goto(count)
          return function()
            vim.diagnostic.jump({
              count = count,
              float = true,
              severity = { min = vim.diagnostic.severity.WARN }
            })
          end
        end
        vim.keymap.set("n", "]d", diagnostic_goto(1), opts)
        vim.keymap.set("n", "[d", diagnostic_goto(-1), opts)

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', function()
          vim.lsp.buf.hover(float_config)
        end, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
        -- Conflicts with tmux
        -- vim.keymap.set('n', '<C-k>', function()
        --   vim.lsp.buf.signature_help(float_config)
        -- end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
      end

      require('mason').setup({})

      local custom_server_configs = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { library = { vim.env.VIMRUNTIME } },
            },
          },
        },

        jsonls = {
          filetypes = { "json", "jsonc" },
          settings = {
            json = {
              schemas = {
                { fileMatch = { "package.json" },                                            url = "https://json.schemastore.org/package.json" },
                { fileMatch = { "tsconfig*.json" },                                          url = "https://json.schemastore.org/tsconfig.json" },
                { fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" }, url = "https://json.schemastore.org/prettierrc.json" },
                { fileMatch = { ".eslintrc", ".eslintrc.json" },                             url = "https://json.schemastore.org/eslintrc.json" },
              },
            },
          },
        },

        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
                "docker-compose*.{yml,yaml}",
                ["http://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
                ["http://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
                ["http://json.schemastore.org/prettierrc.json"] = ".prettierrc.{yml,yaml}",
              },
            },
          },
        },

        cssls = {
          settings = {
            scss = { lint = { unknownAtRules = "ignore" } },
            css = { lint = { unknownAtRules = "ignore" } },
          },
        },

        clangd = {
          capabilities = {
            -- see https://www.reddit.com/r/neovim/comments/17m7hu2/nvchad_multiple_different_client_offset_encodings/
            offsetEncoding = { "utf-16" },
          },
        },
      }

      for _, server_name in ipairs(require('mason-lspconfig').get_installed_servers()) do
        lspconfig[server_name].setup(vim.tbl_extend('force', {
          on_attach = on_attach,
          capabilities = capabilities,
        }, custom_server_configs[server_name] or {}))
      end

      require("typescript-tools").setup({
        on_attach = on_attach,
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
      })

      local luasnip = require('luasnip')
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
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-5),
          ['<C-d>'] = cmp.mapping.scroll_docs(5),

          -- Toggle completion
          ['<C-e>'] = function()
            if cmp.visible() then
              cmp.abort()
            else
              cmp.complete()
            end
          end,

          -- Jump to the next snippet placeholder
          ['<C-f>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          -- Jump to the previous snippet placeholder
          ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
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
        ensure_installed = { 'cspell', 'prettierd', 'eslint_d', 'ruff', 'sqlfluff', 'terraform_fmt' },
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

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({
        sources = {
          cspell.diagnostics.with(cspell_config),
          cspell.code_actions.with(cspell_config),
          null_ls.builtins.formatting.sqlfluff.with({
            extra_args = { "--dialect", "postgres" }, -- dialect is a mandatory flag
          }),
          null_ls.builtins.formatting.terraform_fmt,
          require('none-ls.formatting.ruff').with({ extra_args = { '--extend-select', 'I' } }),
          require('none-ls.formatting.ruff_format'),
          require("none-ls.diagnostics.eslint_d").with(eslint_config),
          require("none-ls.formatting.eslint_d").with(eslint_config),
          require("none-ls.code_actions.eslint_d").with(eslint_config),
          null_ls.builtins.formatting.prettierd, -- prettier should always be after eslint!!!!!!!!!!!!!!
        },
        -- Format on save
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
      })
    end
  }
}
