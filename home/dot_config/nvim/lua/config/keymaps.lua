-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local del=vim.keymap.del
local opts = { noremap = true }
--disabled


--Better navigation
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)
map("n", "<Down>", "gj", opts)
map("n", "<Up>", "gk", opts)
map("n", "<S-Tab>", "<C-w>w", opts)
map("i", "<Down>", "<C-o>gj", opts)
map("i", "<Up>", "<C-o>gk", opts)
map("n", "J", "mzJ`z")

-- map("n", "<C-d>", "<C-d>zz")
-- map("n", "<C-u>", "<C-u>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", '"_d')

--Cursor at bottom of visual select
map("v", "y", "ygv<Esc>", opts)

map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear highlights" })
map("n", "<S-Up>", "<C-a>", { desc = "Increment number" })
map("n", "<S-Down>", "<C-x>", { desc = "Decrement number" })

--windows
map("n", "<C-q>", ":quit<CR>", { desc = "Quit window" })
-- map("n", "<leader>W]", "<cmd>vertical resize +5<cr>")
-- map("n", "<leader>W[", "<cmd>vertical resize -5<cr>")
-- map("n", "<leader>w]", "<cmd>horizontal resize +2<cr>")
-- map("n", "<leader>w[", "<cmd>horizontal resize -2<cr>")

map("n","<leader>[","<C-w>r", {desc = "Swap window left or right"})
map("n","<leader>]","<C-w>R", {desc = "Swap window up or down"})
 
--File shortcuts
map("n", ";q", ":q!<CR>", { desc = "Close file without saving" })
map("n", ";Q", ":qa!<CR>", { desc = "Quit Neovim" })
map("n", ";wq", ":wq<CR>", { desc = "Save and quit" })
map("t", ";tq", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--no highlight
-- map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- vim: ts=2 sts=2 sw=2 et
