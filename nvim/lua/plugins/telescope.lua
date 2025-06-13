local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
require("telescope").load_extension("file_browser")

telescope.setup({
  defaults={
    path_display={"smart"},
    mappings={
      i={
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.send_selected_to_qflist,
          ["<C-d>"] = actions.delete_buffer,
      },
      n={
          ["<C-d>"] = actions.delete_buffer,
      }
    }
  }
})



local keymap = vim.keymap.set

keymap('n','<leader>ff','<cmd>Telescope find_files<cr>',{desc="Find files"})
keymap('n','<leader>fr','<cmd>Telescope oldfiles<cr>',{desc="Find recent files"})
keymap('n','<leader>fs','<cmd>Telescope live_grep<cr>',{desc="Find string in cmd"})
keymap('n','<leader>fc','<cmd>Telescope grep_string<cr>',{desc="Find string under cursor"})
keymap('n','<leader>ft','<cmd>TodoTelescope<cr>',{desc="Find todos"})
keymap("n", "<leader>e", function() require("telescope").extensions.file_browser.file_browser() end)
keymap("n", "<leader>fb", builtin.buffers,{noremap=true, desc="Open buffer list"})


