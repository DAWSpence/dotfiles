--------------------------------------------------------------------------------
--Base settings
--------------------------------------------------------------------------------

-- Set associating between turned on plugins and filetype
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
vim.opt.updatetime = 250
vim.opt.signcolumn = 'yes'
vim.opt.showmode = true
vim.opt.breakindent = true
vim.opt.inccommand = 'split'
vim.opt.hlsearch = true

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




-- vim: tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=1
