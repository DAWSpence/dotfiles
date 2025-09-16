return {
    'neovim/nvim-lspconfig',
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "L3MON4D3/LuaSnip",
    },
    lazy=false,
    config=function()
      local servers={
        "clangd",
        "lua_ls"
      }



      require('mason').setup({
        ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
      })


---------------------------------------------------------------------------
--LSP CONFIG
---------------------------------------------------------------------------


--Diagnostics
      vim.diagnostic.config({
          virtual_lines = true,
          -- virtual_text = true,
          underline = true,
          update_in_insert = false,
          severity_sort = true,
          float = {
              border = "rounded",
              source = true,
          },
          signs = {
              text = {
                  [vim.diagnostic.severity.ERROR] = "󰅚 ",
                  [vim.diagnostic.severity.WARN] = "󰀪 ",
                  [vim.diagnostic.severity.INFO] = "󰋽 ",
                  [vim.diagnostic.severity.HINT] = "󰌶 ",
              },
              numhl = {
                  [vim.diagnostic.severity.ERROR] = "ErrorMsg",
                  [vim.diagnostic.severity.WARN] = "WarningMsg",
              },
          },
      })










---------------------------------------------------------------------------
--LSP INSTALL
---------------------------------------------------------------------------
      require('mason-lspconfig').setup({
        automatic_enable=false,
        ensure_installed = {
          "lua_ls",
          "clangd",
        },
      })




      vim.lsp.config['lua_ls']={

          cmd = {
              "lua-language-server",
            },
            filetypes = {
              "lua",
            },
            root_markers = {
              ".git",
              ".luacheckrc",
              ".luarc.json",
              ".luarc.jsonc",
              ".stylua.toml",
              "selene.toml",
              "selene.yml",
              "stylua.toml",
            },
            settings = {
              Lua = {
                diagnostics = {
                  disable = { "missing-parameters", "missing-fields" },
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                },
              },
            },

            single_file_support = true,
            log_level = vim.lsp.protocol.MessageType.Warning,
      }
      vim.lsp.enable('lua_ls')





      vim.lsp.config['clangd'] = {

        cmd = { "clangd", "--background-index", "--clang-tidy=false" }, 

        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },

        root_markers = {
            "CMakeLists.txt",
            ".clangd",
            ".clang-tidy",
            ".clang-format",
            "compile_commands.json",
            "compile_flags.txt",
            "configure.ac",
            ".git",
            vim.uv.cwd(),
        },

      }
      vim.lsp.enable('clangd')


-----------------------------------------------------------------------
    end,
} 

