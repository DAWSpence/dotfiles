return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()

      require('lualine').setup({
        options={
          theme='onedark',
          component_seperators={left='|',right='|'},
          section_seperators={left='|',right='|'}
        }
      })

    end,

  }