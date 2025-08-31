return {
    'ggandor/leap.nvim',
    config=function()
      vim.keymap.set({'n', 'x', 'o'}, '<leader>f',  '<Plug>(leap-forward)')
      vim.keymap.set({'n', 'x', 'o'}, '<leader>F',  '<Plug>(leap-backward)')
      vim.keymap.set({'n', 'x', 'o'}, '<leader>fw', '<Plug>(leap-from-window)')
    end
  }