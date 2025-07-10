return {
    'neovim/nvim-lspconfig',
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
      { 'j-hui/fidget.nvim', opts = {} },
        'onsails/lspkind.nvim',
    },



    config=function()

      local cmp = require('cmp')
      local cmp_lsp = require('cmp_nvim_lsp')
      local lspconfig=require('lspconfig')

      local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities()) 

      
      vim.api.nvim_create_autocmd('LspAttach', {
        desc='LSP Actions',
        callback=function(event)

          local map = function(mode, keys, func, desc)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          local tmap = function(mode, keys, func, desc)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'TELESCOPE: ' .. desc })
          end


          map("n", "gr", vim.lsp.buf.references, 'Show definition') -- show definition, references

          map("n", "gd", vim.lsp.buf.declaration, 'Goto declaration') -- go to declaration

          map("n", "gi", vim.lsp.buf.implementation, 'Show implementations') -- show lsp implementations

          map("n", "gt", vim.lsp.buf.type_definition, 'Show type definitions') -- show lsp type definitions

          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, 'Show code actions') -- see available code actions, in visual mode will apply to selection

          map("n", "<leader>rn", vim.lsp.buf.rename, 'Smart rename') -- smart rename

          map("n", "<leader>D", vim.diagnostic.show, 'Show diagnostics') -- show  diagnostics for file

          map("n", "<leader>d", vim.diagnostic.open_float, 'Diagnostics for line') -- show diagnostics for line

          map("n", "[d", vim.diagnostic.goto_prev, 'Previous diagnostic') -- jump to previous diagnostic in buffer

          map("n", "]d", vim.diagnostic.goto_next, 'Next diagnositc') -- jump to next diagnostic in buffer

          map("n", "K", vim.lsp.buf.hover, 'Show documentation of attribute') -- show documentation for what is under cursor

          map("n", "<leader>rs", ":LspRestart<CR>", 'Restart LSP') -- mapping to restart lsp if necessary



          --Telescope
          tmap("n", "<leader><leader>tr", "<cmd>Telescope lsp_references<CR>", "Show LSP References") -- show refs

          tmap("n", "<leader><leader>td", "<cmd>Telescope lsp_definitions<CR>", "Show LSP References") -- show definitions

          tmap("n", "<leader><leader>ti", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations") -- show implementations

          tmap("n", "<leader><leader>tt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type defs") -- show type defs

          tmap("n", "<leader><leader>td", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show LSP diagnostics") -- show type defs





          vim.diagnostic.config({
                    -- update_in_insert = true,
                    float = {
                        focusable = false,
                        style = "minimal",
                        border = "rounded",
                        source = "always",
                        header = "",
                        prefix = "",
                    },
                })

        
        end

      })

      

      -----------------------------------------------------------------------
      --LSP SETUP
      -----------------------------------------------------------------------

      -- require('fidget').setup({})
      require('mason').setup()

      require('mason-lspconfig').setup({
        automatic_enable=false,
       ensure_installed = {
          -- "bashls",
          "lua_ls",
          "clangd",
          -- "cmake",
        },


        handlers={

          function(server_name)
            require('lspconfig')[server_name].setup({
              on_attach=on_attach,
              capabilities=capabilities,
              handlers=handlers,
            })
          end,


          ["lua_ls"] = function()

            lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
               
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
            })
          end,


          ['clangd'] = function()
              lspconfig['clangd'].setup({
                  capabilities=capabilities,
              })
          end,


          -- ['cmake'] = function()
          --     lspconfig['cmake'].setup({})
          -- end,


          -- ['pyright'] = function()
          --     lspconfig['pyright'].setup({})
          -- end,


        },

      })













-----------------------------------------------------------------------
    end,
} 

