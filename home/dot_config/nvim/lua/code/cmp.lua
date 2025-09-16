return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),

      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    luasnip.config.setup {}

    require("luasnip.loaders.from_vscode").lazy_load()

    local kind_icons = {
      Text = '󰉿',
      Method = 'm',
      Function = '󰊕',
      Constructor = '',
      Field = '',
      Variable = '󰆧',
      Class = '󰌗',
      Interface = '',
      Module = '',
      Property = '',
      Unit = '',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰇽',
      Struct = '',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '󰊄',
    }



    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({

        ["<C-k>"] = cmp.mapping.select_prev_item(),

        ["<C-j>"] = cmp.mapping.select_next_item(),

        ["<C-p>"] = cmp.mapping.scroll_docs(-4),

        ["<C-n>"] = cmp.mapping.scroll_docs(4),

        ["<C-Space>"] = cmp.mapping.complete(),

        ["<C-e>"] = cmp.mapping.abort(),

        ["<CR>"] = cmp.mapping.confirm({ select = false }),


        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),


        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),


        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),

      }),




      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" },  -- text within current buffer
        { name = "path" },    -- file system paths
      }),




      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },

        format = function(entry, vim_item)
          vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
          vim_item.menu = ({

            nvim_lsp = '[LSP]',
            luasnip = '[Snippet]',
            buffer = '[Buffer]',
            path = '[Path]',

          })[entry.source.name]

          return vim_item
        end,
      },

    })


    -- `/` cmdline setup.
    cmp.setup.cmdline({ '/', '?' }, {
      completion = { completeopt = 'menu,menuone,noselect' },
      mapping=cmp.mapping.preset.cmdline({

        ['<C-j>'] = { c = cmp.mapping.select_next_item( { behavior= cmp.SelectBehavior.Insert} ) },
        ['<C-k>'] = { c = cmp.mapping.select_prev_item( { behavior= cmp.SelectBehavior.Insert} ) },

      }),
      sources = {
        { name = 'buffer' },
      },
    })


    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      completion = { completeopt = 'menu,menuone,noselect' },
      mapping=cmp.mapping.preset.cmdline({

        ['<C-j>'] = { c = cmp.mapping.select_next_item( { behavior= cmp.SelectBehavior.Insert} ) },
        ['<C-k>'] = { c = cmp.mapping.select_prev_item( { behavior= cmp.SelectBehavior.Insert} ) },

      }),
      sources = cmp.config.sources(
        { { name = 'path' } },
        { { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } } }
      ),
    })
  end,


}
