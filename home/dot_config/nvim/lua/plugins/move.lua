return   {
    "hinell/move.nvim",
    config=function()
      local opts={noremap=true,silent=true}
      local map=vim.keymap.set
      map('x', '<C-k>', ':MoveBlock -1<CR>', opts)
      map('x', '<C-j>', ':MoveBlock 1<CR>', opts)
      map('x', '<C-h>', ':MoveHBlock -1<CR>', opts)
      map('x', '<C-l>', ':MoveHBlock 1<CR>', opts)
    end

  }