local cmp = require('cmp')
local luasnip = require('luasnip')
luasnip.config.setup{}
require('lspkind').setup()


cmp.setup{
  mapping=cmp.mapping.preset.insert{

    ['<C-Space>'] = cmp.mapping.complete{},
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), 
    ['<C-b>']=cmp.mapping.scroll_docs(-4),
    ['<C-f>']=cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.config.disable,                      
    ['<C-p>'] = cmp.mapping.select_prev_item()
    ['<C-n>'] = cmp.mapping.select_next_item()

  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },                -- LSP
    { name = 'nvim_lsp_signature_help' }, -- LSP for parameters in functions
    { name = 'nvim_lua' },                -- Lua Neovim API
    { name = 'luasnip' },                 -- Luasnip
    { name = 'buffer' },                  -- Buffers
    { name = 'path' },                    -- Paths
  }),

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
}




-- Add snippets from Friendly Snippets
-- require("luasnip/loaders/from_vscode").lazy_load()

