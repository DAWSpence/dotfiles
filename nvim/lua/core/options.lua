vim.cmd[[filetype plugin on]]
vim.cmd[[autocmd FileType * setlocal formatoptions-=cro]]
vim.cmd[[autocmd VimResized * wincmd =]]

-- opts
vim.opt.termguicolors=true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.laststatus=2
vim.opt.clipboard = 'unnamedplus'
vim.opt.fixeol = false
vim.opt.foldmethod = 'manual'
vim.opt.ignorecase = true
vim.opt.joinspaces = false
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.virtualedit = 'block'
vim.opt.scrolloff = 100
vim.opt.timeoutlen = 300
vim.opt.updatetime = 50
vim.opt.signcolumn = 'yes'
vim.opt.showmode = true
vim.opt.breakindent = true
vim.opt.inccommand = 'split'
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.mouse = 'a'
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.listchars = { tab = '| ', trail = '·', nbsp = '␣' }
vim.opt.list = true
vim.opt.guicursor ={
  "n-v-c:block-Cursor/lCursor",         -- Block cursor in normal, visual, and command modes
  "i:ver25-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",  -- Blinking vertical line in insert mode
  "r-cr-o:hor20-Cursor/lCursor",        -- Horizontal line cursor in replace, command-line replace, and operator-pending modes
  "a:blinkwait700-blinkoff400-blinkon250",  -- Global blinking settings for all modes
}
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.colorcolumn="80"


--------------------------------------------------------------------------------
-- Autocmds
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

vim.keymap.set('n','<leader>oq','<cmd>copen<CR>',{desc='Open quickfix'})

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



-- vim: ts=2 sts=2 sw=2 et
