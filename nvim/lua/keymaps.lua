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

--File shortcuts
map('n','<leader>ww',':w<CR>',{desc="Save file"})
map('n','<leader>wq',':wq<CR>',{desc="Save file and quit"})
map('n','<leader>qq',':q!<CR>',{desc="Quit"})
map('n','<S-q>',':qa!<CR>',{desc="Quit neovim"})
map('t', '<leader>qt', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--no highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>')





-- Diagnostic keymaps
-- map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.

--
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes

-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- vim: ts=2 sts=2 sw=2 et
