return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', 
    'MunifTanjim/nui.nvim',
  },
  lazy = false,

  keys = {

    { '<leader>ee', ':Neotree reveal<CR>', desc = 'File explorer', silent = true },
    { '<leader>ec', ':Neotree Neotree toggle current reveal_force_cwd<CR>', desc = 'Neotree open cwd', silent = true },

  },

  opts = {
    filesystem = {

      bind_to_cwd=true,
      follow_current_file={enabled = true},

      cwd_target={
        sidebare="cwd",
        current="cwd"
      },

      window = {

        mappings = {
          ['<leader>eq'] = 'close_window',
        },




      },
    },
  },
}
