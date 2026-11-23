vim.api.nvim_create_autocmd("BufEnter",{
  pattern = "*.txt, text",
  callback = function()
    vim.opt.spell=false
  end
  }
)