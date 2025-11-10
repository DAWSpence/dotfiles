return {

  --https://github.com/nvim-mini/mini.splitjoin
  {
    "nvim-mini/mini.splitjoin",
    config = function()

      require("mini.splitjoin").setup({
        mappings = {
          toggle = '<leader>jt',
          split = '<leader>js',
          join = '<leader>jj',
        },

          options = {
            split_pattern = '',
            justify_side = 'left',
            merge_delimiter = '',
        },

          steps = {
            pre_split = {},
            split = nil,
            pre_justify = {},
            justify = nil,
            pre_merge = {},
            merge = nil,
        },

        silent = true,

      })

    end
  },



  --https://github.com/nvim-mini/mini.align
  {
    "nvim-mini/mini.align",
    config = function()

      require("mini.align").setup({
        mappings = {
          start = '<leader>a',
          start_with_preview = '<leader>A',
        },

        options = {
          split_pattern = '',
          justify_side = 'left',
          merge_delimiter = '',
        },

        steps = {
          pre_split = {},
          split = nil,
          pre_justify = {},
          justify = nil,
          pre_merge = {},
          merge = nil,
        },

        silent = true,

      })

    end
  }

}