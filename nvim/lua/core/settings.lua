--------------------------------------------------------------------------------
--Base settings
--------------------------------------------------------------------------------

-- Set associating between turned on plugins and filetype
cmd[[filetype plugin on]]

-- Disable comments on pressing Enter
cmd[[autocmd FileType * setlocal formatoptions-=cro]]

--Keep buffer sizes consistent
cmd[[autocmd VimResized * wincmd =]]


-- opts
vim.opt.termguicolors=true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.laststatus=2
vim.
vim.opt.clipboard = 'unnamedplus'
vim.opt.fixeol = false
vim.
vim.opt.foldmethod = 'manual'
vim.
vim.opt.ignorecase = true
vim.opt.joinspaces = false
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.
vim.opt.number=true
vim.opt.relativenumber=true
vim.
vim.opt.virtualedit = 'block'
vim.opt.scrolloff = 100
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250
vim.opt.signcolumn = 'yes'
vim.opt.showmode = true
vim.opt.breakindent = true
vim.
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
