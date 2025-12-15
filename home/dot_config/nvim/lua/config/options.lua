-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here


--init
vim.cmd[[filetype plugin on]]
vim.cmd[[autocmd FileType * setlocal formatoptions-=cro]]
vim.cmd[[autocmd VimResized * wincmd =]]


-- opts
--leader keys
vim.g.mapleader=' '
vim.g.maplocalleader=' '

--general ui
vim.opt.termguicolors=true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
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

--search
vim.opt.inccommand = 'split'
vim.opt.hlsearch = true
vim.opt.incsearch = true

--mouse and cursor
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

--formatting
vim.g.autoformat = false

--spellcheck
vim.opt.spell=false

-- vim: ts=2 sts=2 sw=2 et
