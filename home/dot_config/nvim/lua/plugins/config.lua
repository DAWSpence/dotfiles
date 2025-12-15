--this is where we config lazyvim plugins, user plugins are configured in their respective files.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = 
    { 
      ensure_installed = { 
        "git_config",
        "gitcommit",
        "git_rebase",
        "gitignore",
        "gitattributes",
        "dockerfile",
        "cmake",
        "make"
       }

    },
  },

  {
    "folke/snacks.nvim",
    opts = {

      indent = {
        enabled = true,
        animate = {
          enabled = false,
        },

      -- picker = {
      --   files = {
      --     cmd = "find"
      --     cmd = "rg"
      --     cmd = "fd"
      --   }
      -- },

      },

      input = { enabled = true },
      notifier = { enabled = false },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false }, 
      toggle = { map = LazyVim.safe_keymap_set },
      words = { enabled = true },
    },
  },



  {
    "saghen/blink.cmp",

    opts = {

      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<C-y>"] = { "select_and_accept", "fallback" },
        ["<C-j>"] = { "select_next", "fallback_to_mappings" },
        ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "scroll_documentation_down", "fallback" },
        ["<C-p>"] = { "scroll_documentation_up", "fallback" },
      },

      cmdline = {
        enabled = true,

        keymap = { 
          preset = 'inherit'
         },
        
        sources = {
          'cmdline'
        },

        completion = { 
          menu = { auto_show = true }
         },

      },

    },
    
  },



  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     autoformat = false,
  --   },
  -- },


  {
    "rcarriga/nvim-notify",
    opts = {
      render = "minimal",
      stages = "static",
      level = 3,
    },
  },


  {
    "akinsho/bufferline.nvim",
    keys={
      { "<S-q>", "<cmd>bdelete!<CR>", desc = "Close buffer" },
      { "<S-n>", "<cmd>BufferLineMovePrev", desc = "Move buffer prev" },
      { "<S-m>", "<cmd>BufferLineMoveNext", desc = "Move buffer next" },
    }
  },


  {
    "L3MON4D3/LuaSnip",
    opts={}
  },

  {
    "snacks.nvim",
    keys = {
        { "<C-e>", function() Snacks.explorer() end, desc = "File Explorer (VScode)" },
    }
  },


  --https://github.com/nvim-mini/mini.surround/tree/main
  {
    "nvim-mini/mini.surround",
    opts = {
        -- Add custom surroundings to be used on top of builtin ones. For more
        -- information with examples, see `:h MiniSurround.config`.
        -- basically a table, i.e custom_surroundings = {
          -- blah blah...
--        }
        custom_surroundings = nil,

        -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
        highlight_duration = 100,

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {

          add = 'gsa', -- Add surrounding in Normal and Visual modes
          delete = 'gsd', -- Delete surrounding
          find = 'gsf', -- Find surrounding (to the right)
          find_left = 'gsF', -- Find surrounding (to the left)
          highlight = 'gsh', -- Highlight surrounding
          replace = 'gsr', -- Replace surrounding
	  update_n_lines = 'gsn', -- Update n_lines

          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },

        -- Number of lines within which surrounding is searched
        n_lines = 20,

        -- Whether to respect selection type:
        -- - Place surroundings on separate lines in linewise mode.
        -- - Place surroundings on each line in blockwise mode.
        respect_selection_type = false,

        -- How to search for surrounding (first inside current line, then inside
        -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
        -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
        -- see `:h MiniSurround.config`.
        search_method = 'cover',

        -- Whether to disable showing non-error feedback
        -- This also affects (purely informational) helper messages shown after
        -- idle time if user input is required.
        silent = true,
    }
  },



  {
    "nvim-mini/mini.move",

      opts={

          mappings = {
            -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
            left = '<M-h>',
            right = '<M-l>',
            down = '<M-j>',
            up = '<M-k>',

            -- Move current line in Normal mode
            line_left = '<M-h>',
            line_right = '<M-l>',
            -- line_down = '[A',
            -- line_up = ']A',
        },

        -- Options which control moving behavior
        options = {
          -- Automatically reindent selection during linewise vertical move
          reindent_linewise = true,
        },

      } 
  }


}
