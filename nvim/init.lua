--Map leaders
vim.g.mapleader=' '

vim.g.maplocalleader=' '

--Gloabl aliases
require ("helpers/globals")

--Keybinding functions
require ('helpers/keyboard')

-- General settings
require ("settings/general")

-- Bootsraping plugin manager
require ("lazy-bootstrap")

-- Plugin management 
require("lazy").setup({
  require("plugins-nvim"),
  require("plugins-vim")
})

-- Keybindings
require ("settings/keybindings")

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
