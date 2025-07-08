-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del=vim.keymap.del
local opts={noremap=true}

---------------------------------------------------------------------
--Delete keymaps
---------------------------------------------------------------------
del("n", "<leader>qq")



---------------------------------------------------------------------

map("n", "<leader>q", "<cmd>:q!<cr>", { desc = "Close file" })
map("n", "<leader>Q", "<cmd>:qa!<cr>", { desc = "Quit All" })
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map('n','<leader>nh',':nohl<CR>',{desc="Clear highlights"})
map('v','y','ygv<Esc>',opts)

