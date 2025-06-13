--BASIC KEYBINDINGS--
local map = vim.keymap.set
local mapopts=vim.api.nvim_set_keymap
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






--Tabs
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) 
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) 
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) 
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) 
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) 


-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
