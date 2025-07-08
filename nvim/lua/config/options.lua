-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.maplocalleader=" "

vim.g.autoformat=false

vim.g.snacks_animate=false

vim.opt.swapfile=false

vim.opt.backup=false

vim.opt.mouse = 'a'

vim.opt.clipboard = 'unnamedplus'

vim.opt.fixeol = false



-- vim.opt.guicursor ={
--   "n-v-c:block-Cursor/lCursor",         -- Block cursor in normal, visual, and command modes
--   "i:ver25-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",  -- Blinking vertical line in insert mode
--   "r-cr-o:hor20-Cursor/lCursor",        -- Horizontal line cursor in replace, command-line replace, and operator-pending modes
--   "a:blinkwait700-blinkoff400-blinkon250",  -- Global blinking settings for all modes
-- }