local map = vim.keymap.set
local opts={noremap=true}

--Better navigation
map('n','j','gj',opts)
map('n','k','gk',opts)
map('n','<Down>','gj',opts)
map('n','<Up>','gk',opts)
map('n','<S-Tab>','<C-w>w',opts)
map('i','<Down>','<C-o>gj',opts)
map('i','<Up>','<C-o>gk',opts)
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", "\"_d")








--Cursor at bottom of visual select
map('v','y','ygv<Esc>',opts)


--Better window navigation
map('n','<C-h>','<C-w><C-h>',opts)
map('n','<C-l>','<C-w><C-l>',opts)
map('n','<C-j>','<C-w><C-j>',opts)
map('n','<C-k>','<C-w><C-k>',opts)

map('n','<leader>nh',':nohl<CR>',{desc="Clear highlights"})
map('n','<leader>=','<C-a>',{desc="Increment number"})
map('n','<leader>-','<C-x>',{desc="Decrement number"})

map('n','<leader>sv','<C-w>v',{desc="Split vertically"})
map('n','<leader>sh','<C-w>s',{desc="Split horizontally"})
map('n','<leader>se','<C-w>=',{desc="Split equal"})
map('n','<leader>sq','<cmd>close<CR>',{desc="Close split"})

map("n", "<leader>[", "<cmd>vertical resize +5<cr>") -- make the window biger vertically
map("n", "<leader>]", "<cmd>vertical resize -5<cr>") -- make the window smaller vertically
map("n", "<leader>-", "<cmd>horizontal resize +2<cr>") -- make the window bigger horizontally by pressing shift and =
map("n", "<leader>=", "<cmd>horizontal resize -2<cr>") -- make the window smaller horizontally by pressing shift and -

--File shortcuts
-- map('n','<leader>w',':w<CR>',{desc="Save file"})
-- map('n','<leader>W',':wq<CR>',{desc="Save file and quit"})
map('n',';q',':q!<CR>',{desc="Close file without saving"})
map('n',';Q',':qa!<CR>',{desc="Quit Neovim"})
map('n',';wq',':wq<CR>',{desc="Save and quit"})
map('t', ';tq', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--no highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

--quickfix
map('n','<leader>qf','<cmd>copen<CR>',{desc='Open quickfix'})








-- Diagnostic keymaps
-- map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.

--
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes

-- map("n", "<leader>,", "<C-w>H", { desc = "Move window to the left" })
-- map("n", "<leader>.", "<C-w>L", { desc = "Move window to the right" })
-- map("n", "<leader>;", "<C-w>J", { desc = "Move window to the lower" })
-- map("n", "<leader>'", "<C-w>K", { desc = "Move window to the upper" })

-- vim: ts=2 sts=2 sw=2 et
