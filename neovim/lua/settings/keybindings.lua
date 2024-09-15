--BASIC KEYBINDINGS--

--Better window navigation
nm('<C-h>','<C-w><C-h>')
nm('<C-l>','<C-w><C-l>')
nm('<C-j>','<C-w><C-j>')
nm('<C-k>','<C-w><C-k>')

--Clear highlights with esc
nm('<Esc>','<cmd>nohlsearch<CR>')

--Better navigation
nm('j','gj')
nm('k','gk')
nm('<Down>','gj')
nm('<Up>','gk')
nm('<S-Tab>','<C-w>w')
im('<Down>','<C-o>gj')
im('<Up>','<C-o>gk')

--Cursor at bottom of visual select
vm('y','ygv<Esc>')






--WHICH KEY--

local wk = require("which-key")

--Global
wk.register(
    {
    ["K"] = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Hover information"},
    ["<leader>o"] = {"<cmd>Telescope find_files<cr>", "Find files"},
    ["<leader>p"] = {"<cmd>Telescope oldfiles<cr>", "Previous files"},
    ["<leader>f"] = {"<cmd>Telescope find_files<cr>", "Find in files"},
    ["gd"] = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Go to declaration" },
    ["gr"] = {"<cmd>Telescope lsp_references<cr>", "Go to references"},
    }

    )


-- LSP 
wk.register({
l = {
    name = "LSP",
    ["r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol" },
    ["a"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
}
}, { prefix = "<leader>" })


-- Telescope 
wk.register({
t = {
    name = "Telescope",
    t = {"<cmd>Telescope<cr>", "Open Telescope"},
    p = {"<cmd>Telescope oldfiles<cr>", "Oldfiles"},
    s = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace symbols"},
    j = {"<cmd>Telescope jumplist<cr>", "Jumplist"},
    b = {"<cmd>Telescope buffers<cr>", "Buffers"},
    q = {"<cmd>Telescope quickfix<cr>", "Quickfix list"},
    r = {"<cmd>Telescope resume<cr>", "Previous Telescope window"},
    o = {"<cmd>Telescope find_files<CR>", "Find files"},
    g = {
    name = "Git",
    b = {"<cmd>Telescope git_branches<cr>", "Git branches"},
    o = { "<cmd>Telescope git_files<cr>", "Git files"},
    }
}
}, { prefix = "<leader>"})



-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
