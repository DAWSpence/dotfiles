-- LSP Plugins
--needs to be fixed

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
          
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", {buffer=event.event, slient=true, desc="Show LSP references"}) 

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=event.event, slient=true, desc="Go to declaration"}) 

        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {buffer=event.event, slient=true, desc="Show LSP definitions"}) 

        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", {buffer=event.event, slient=true, desc="Show LSP implementations"}) 

        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", {buffer=event.event, slient=true, desc="Show LSP type definitions"}) 

        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {buffer=event.event, slient=true, desc="See available code actions"}) 

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=event.event, slient=true,desc="Smart rename"}) 

        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", {buffer=event.event, slient=true, desc="Show buffer diagnostics"}) 

        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {buffer=event.event, slient=true,desc="Show line diagnostics"}) 

        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {buffer=event.event, slient=true,desc="Go to previous diagnostic"}) 

        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {buffer=event.event, slient=true,desc="Go to next diagnostic"}) 

        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=event.event, slient=true,desc="Show documentation for what is under cursor"}) 

        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", {buffer=event.event, slient=true,desc="Restart LSP"}) 





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


      require('fidget').setup({})
      require('mason').setup()

      require('mason-lspconfig').setup({
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

    end,
} 

