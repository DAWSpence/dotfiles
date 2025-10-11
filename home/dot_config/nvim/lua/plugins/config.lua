--this is where we config lazyvim plugins, user plugins are configured in their respective files.
return {


  {
    "folke/snacks.nvim",
    opts = {

      indent = {
        enabled = true,
        animate = {
          enabled = false,
        },
      },

      input = { enabled = true },
      notifier = { enabled = false },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false }, -- we set this in options.lua
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
        ['<CR>'] = { 'accept_and_enter', 'fallback' },
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




  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
  },


  {
    "rcarriga/nvim-notify",
    opts = {
      render = "minimal",
      stages = "static",
    },
  },


  {
    "akinsho/bufferline.nvim",
    keys={
      { "<S-q>", "<cmd>bdelete!<CR>", desc = "Close buffer" },
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
  }

}
