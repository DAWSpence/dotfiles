return {
    'stevearc/oil.nvim',
    dependencies={'nvim-tree/nvim-web-devicons'},

    config=function()
      require('oil').setup({
        default_file_explorer=true,
      })
        vim.keymap.set('n','-','<cmd>Oil<CR>',{desc='Open file explorer'})
    end
  }