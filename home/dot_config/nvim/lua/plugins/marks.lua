return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  config = function ()

    require("marks").setup({
      mappings={
        next = "<leader>mj",
        prev = "<leader>mk"
      }
    })

    vim.keymap.set("n", "<leader>mx", ":MarksQFListGlobal<CR>", {noremap = true})
    vim.keymap.set("n", "<leader>ml", ":MarksListBuf<CR>", {noremap = true})

  end

}
