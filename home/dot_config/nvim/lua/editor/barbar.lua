return {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', 
      'nvim-tree/nvim-web-devicons', 
    },

    config = function()
      vim.g.barbar_auto_setup=false
      require('barbar').setup({
        animation=false,
        clickabble=true,
        auto_hide=1
      })

      local map = vim.keymap.set

      map('n','<S-h>','<cmd>BufferPrevious<CR>',{noremap=true,desc='Previous tab'})
      map('n','<S-l>','<cmd>BufferNext<CR>',{noremap=true,desc='Next tab'})
      map('n','<S-n>','<cmd>BufferMovePrevious<CR>',{noremap=true,desc='Swap previous tab'})
      map('n','<S-m>','<cmd>BufferMoveNext<CR>',{noremap=true,desc='Swap next buffer'})
      map('n','<S-q>','<cmd>BufferClose<CR>',{noremap=true,desc='Close buffer'})
      map('n', '<S-1>', '<cmd>BufferLast!<CR>',   {noremap=true})
      map('n', '<S-2>', '<cmd>BufferGoto 1<CR>',   {noremap=true})

    end

  }