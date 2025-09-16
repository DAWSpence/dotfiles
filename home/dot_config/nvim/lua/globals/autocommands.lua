--------------------------------------------------------------------------------
-- Autocmds
--organize them
--------------------------------------------------------------------------------

--Highlight text after yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text.',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })



  --Quickfix config
  --https://www.reddit.com/r/neovim/comments/1g7v295/navigating_the_quickfix_list/

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',

  callback = function(event)
    local opts = {buffer = event.buf}


    vim.keymap.set('n', '<C-p>', function()
      if vim.fn.line('.') == 1 then -- if it's first line
        vim.cmd('norm! G') -- back to bottom
        return
      end
    end, opts)

    vim.keymap.set('n', '<C-p>', function()
      if vim.fn.line('.') == vim.fn.line('$') then -- if it's last line
        vim.cmd('norm! gg') -- back to top
        return
      end
    end, opts)

    vim.keymap.set('n', 'k', '<cmd>cnext<CR>',opts)
    vim.keymap.set('n', 'j', '<cmd>cprev<CR>',opts)
    vim.keymap.set('n', '<leader>j', '<cmd>lnext<CR>',opts)
    vim.keymap.set('n', '<leader>k', '<cmd>lprev<CR>',opts)


    vim.keymap.set('n', 'K', '<cmd>cnfile<CR>',opts)
    vim.keymap.set('n', 'J', '<cmd>cNfile<CR>',opts)
    vim.keymap.set('n','q','<cmd>cclose<CR>',opts)


  end,
})




