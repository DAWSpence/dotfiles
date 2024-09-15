-- Set associating between turned on plugins and filetype
cmd[[filetype plugin on]]

-- Disable comments on pressing Enter
cmd[[autocmd FileType * setlocal formatoptions-=cro]]

--Keep buffer sizes consistent
cmd[[autocmd VimResized * wincmd =]]


--Base settings

opt.termguicolors=true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.laststatus=2

opt.clipboard = 'unnamedplus'
opt.fixeol = false

opt.foldmethod = 'manual'

opt.ignorecase = true
opt.joinspaces = false
opt.smartcase = true
opt.showmatch = true

opt.splitbelow = true
opt.splitright = true

opt.wildmenu = true
opt.wildmode = "longest:full,full"

opt.number=true
opt.relativenumber=true

opt.virtualedit = 'block'
opt.scrolloff = 100
opt.timeoutlen = 300
opt.updatetime = 250
opt.signcolumn = 'yes'
opt.showmode = true
opt.breakindent = true

opt.inccommand = 'split'
opt.hlsearch = true

-- Autocmds

--Highlight text after yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text.',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })
-- vim: tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=1
