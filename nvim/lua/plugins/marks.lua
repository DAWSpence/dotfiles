--to create a bookmark at location, type ma
return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {
    mappings={
      set="<leader>ms",
      delete="<leader>md",
      delete_line="<leader>ml",
      delete_buf="<leader>mD",
      prev="<leader>mj",
      next="<leader>mk",
      next_bookmark="<leader>bj",
      prev_bookmark="<leader>bk",
    }
  },

  config=function()
    vim.keymap.set('n','<leader>bs','<Plug>(Marks-set-bookmark[0-9])',{desc="Set bookmark[0-9]",silent=true})
    vim.keymap.set('n','<leader>bd','<Plug>(Marks-delete-bookmark[0-9])',{desc="Delete bookmark[0-9]",silent=true})
  end

}