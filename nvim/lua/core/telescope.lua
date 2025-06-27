
return {
  { 
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    lazy=false,
    branch="0.1.x",

    dependencies = {
      'nvim-lua/plenary.nvim',
      "ahmedkhalf/project.nvim",
      "nvim-telescope/telescope-file-browser.nvim",

      { 
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',

        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },

      { 'nvim-telescope/telescope-ui-select.nvim' },

      
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },

    config = function()

      local actions = require("telescope.actions")
      require("telescope").load_extension("file_browser")
      require('telescope').setup {

        defaults = {
          mappings = {
            i = {
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-k>"] = actions.move_selection_previous,
                  ["<C-q>"] = actions.send_selected_to_qflist,
                  ["<C-d>"] = actions.delete_buffer,
            },
          },
        },
        -- pickers = {}



        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      
      local builtin = require ( 'telescope.builtin' )
      vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = 'Search Help' })
      vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = 'Search Keymaps' })
      vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Search Files' })
      vim.keymap.set('n', '<leader>ts', builtin.builtin, { desc = 'Search Select Telescope' })
      vim.keymap.set('n', '<leader>tw', builtin.grep_string, { desc = 'Search current Word' })
      vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = 'Search by Grep' })
      vim.keymap.set('n', '<leader>td', builtin.diagnostics, { desc = 'Search Diagnostics' })
      vim.keymap.set('n', '<leader>tr', builtin.resume, { desc = 'Search Resume' })
      vim.keymap.set('n', '<leader>to.', builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>tb', builtin.buffers, { desc = 'Find existing buffers' })
      vim.keymap.set('n', '<leader>te', function() require("telescope").extensions.file_browser.file_browser() end, { desc = 'LSP references' })

      

      vim.keymap.set('n', '<leader>tb', function()
        

        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = 'Fuzzily search in current buffer' })


      vim.keymap.set('n', '<leader>t/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = 'Search in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>tn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Search Neovim files' })
    end,
  },

}
-- vim: ts=2 sts=2 sw=2 et
