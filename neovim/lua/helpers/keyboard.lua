-- Alias for function, that set new keybindings
local map = vim.api.nvim_set_keymap

--Nonrecursive

-- Normal mode keybinding setter
function nm(key, command)
	map('n', key, command, {noremap = true})
end

-- Input mode keybinding setter
function im(key, command)
	map('i', key, command, {noremap = true})
end

-- Visual mode keybinding setter
function vm(key, command)
	map('v', key, command, {noremap = true})
end

-- Terminal mode keybinding setter
function tm(key, command)
	map('t', key, command, {noremap = true})
end


--Recursive

function nr(key, command)
	map('n', key, command)
end

-- Input mode keybinding setter
function ir(key, command)
	map('i', key, command)
end

-- Visual mode keybinding setter
function vmr(key, command)
	map('v', key, command)
end

-- Terminal mode keybinding setter
function tmr(key, command)
	map('t', key, command)
end

