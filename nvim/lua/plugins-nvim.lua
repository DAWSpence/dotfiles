return {

  --Catppuccin  
  {
    "catppuccin/nvim", 
    name = "catppuccin",
    config = function()
        require("config-nvim.catppuccin")
    end
  },

  -- Mason  
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require "config-nvim.mason"
    end
  },

-- Which key  
{
  "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("config-nvim.which-key")
    end,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
},

  -- Telescope  
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      require "config-nvim.telescope"
    end
  },

  -- CMP  
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      -- 'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require "config-nvim.cmp"
    end
  },

  -- Git Signs 
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require "config-nvim.gitsigns"
    end
  },


  -- TreeSitter  
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "config-nvim.treesitter"
    end
  },

  -- Mini.nvim  
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function ()
      require("config-nvim.mini")
    end
  },


  --Toggleterm
  {'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
      require ("config-nvim.toggleterm")
    end
  },




}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
