return {
  "sindrets/winshift.nvim",
  config = function()
    require("winshift").setup()
    vim.keymap.set("n", "<leader>wm", "<cmd>WinShift<CR>", { desc = "Window swapping mode", noremap = true, silent = true })
  end
}
