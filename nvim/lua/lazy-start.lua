return {

    --Tokyo night dark  
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      setup='night'
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()

      require('lualine').setup({
        options={
          theme='onedark',
          component_seperators={left='|',right='|'},
          section_seperators={left='|',right='|'}
        }
      })

    end

  },


  {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      local substitute = require("substitute")
      substitute.setup()

      local keymap = vim.keymap.set 
      keymap("n", "s", substitute.operator, { desc = "Substitute with motion" })
      keymap("n", "ss", substitute.line, { desc = "Substitute line" })
      keymap("n", "S", substitute.eol, { desc = "Substitute to end of line" })
      keymap("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
    end,

  },


  
  -- -- LSP config/mason
  -- {
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --   -- Automatically install LSPs and related tools to stdpath for Neovim
  --   { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
  --   'williamboman/mason-lspconfig.nvim',
  --   'WhoIsSethDaniel/mason-tool-installer.nvim',

  --   -- Useful status updates for LSP.
  --   -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  --   { 'j-hui/fidget.nvim', opts = {} },

  --   -- Allows extra capabilities provided by nvim-cmp
  --   'hrsh7th/cmp-nvim-lsp',
  --   },

  --   config=function()
  --     require('plugins.lsp')
  --   end,

  -- },


  --nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", 
      "hrsh7th/cmp-path", 
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*", 
        build = "make install_jsregexp",
      },
      "saadparwaiz1/cmp_luasnip", 
      "rafamadriz/friendly-snippets", 
      "onsails/lspkind-nvim", 
    },
    config=function()
      require('plugins-cmp')
    end
  },




-- indent breakline
{
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = {
      char = '▏',
    },
    scope = {
      show_start = false,
      show_end = false,
      show_exact_scope = false,
    },
    exclude = {
      filetypes = {
        'help',
        'startify',
        'dashboard',
        'packer',
        'neogitstatus',
        'NvimTree',
        'Trouble',
      },
    },
  },
},


{
   'numToStr/Comment.nvim',
  opts = {},
  config = function()
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<C-/>', require('Comment.api').toggle.linewise.current, opts)
    vim.keymap.set('v', '<C-/>', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
  end,
},


-- Which key  
{
  "folke/which-key.nvim",
    event = "VeryLazy",

    config = function()
      require("which-key").setup({
        notify=false
      })
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
      "nvim-telescope/telescope-file-browser.nvim"
    },
    config = function()
      require ( "plugins.telescope" )
    end
  },




  -- CMP  
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      'L3MON4D3/LuaSnip',
      build = function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end,

      {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind'
    },
    config = function()
      require ( "plugins.autocomplete" )
    end,

  },

  -- Git Signs 
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require ( "plugins.gitsigns" )
    end
  },


  -- TreeSitter  
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require ("plugins.treesitter")
    end
  },

  -- Mini.nvim  
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function ()
      require('mini.surround').setup()
      require('mini.jump').setup()
    end
  },


  --autopairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {} 
  },


  --Toggleterm
  {'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
      require ("plugins.toggleterm")
    end
  },

  --winresize plugin
  {
    "pogyomo/winresize.nvim",
    config = function ()

      local resize = function(win, amt, dir)
          return function()
              require("winresize").resize(win, amt, dir)
          end
      end

      vim.keymap.set("n", "rh", resize(0, 2, "left"))
      vim.keymap.set("n", "rj", resize(0, 1, "down"))
      vim.keymap.set("n", "rk", resize(0, 1, "up"))
      vim.keymap.set("n", "rl", resize(0, 2, "right"))

    end
  },


  --barbar

  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', 
      'nvim-tree/nvim-web-devicons', 
    },

    config = function()

      require('barbar').setup({
        animation=false,
        clickabble=true,
        auto_hide=1
      })

      local map = vim.keymap.set

      map('n','<S-h>','<cmd>BufferPrevious<CR>',{noremap=true,desc='Previous tab'})
      map('n','<S-l>','<cmd>BufferNext<CR>',{noremap=true,desc='Next tab'})
      map('n','<S-n>','<cmd>BufferMovePrevious<CR>',{noremap=true,desc='Swap previous tab'})
      map('n','<S-m>','<cmd>BufferMoveNext<CR>',{noremap=true,desc='Swap next buffer'})
      map('n','<C-q>','<cmd>BufferClose<CR>',{noremap=true,desc='Close buffer'})


      map('n', '<S-1>', '<cmd>BufferGoto 1<CR>', {noremap=true})
      map('n', '<S-2>', '<cmd>BufferGoto 2<CR>', {noremap=true})
      map('n', '<S-3>', '<cmd>BufferGoto 3<CR>', {noremap=true})
      map('n', '<S-4>', '<cmd>BufferGoto 4<CR>', {noremap=true})
      map('n', '<S-5>', '<cmd>BufferGoto 5<CR>', {noremap=true})
      map('n', '<S-6>', '<cmd>BufferGoto 6<CR>', {noremap=true})
      map('n', '<S-7>', '<cmd>BufferGoto 7<CR>', {noremap=true})
      map('n', '<S-8>', '<cmd>BufferGoto 8<CR>', {noremap=true})
      map('n', '<S-9>', '<cmd>BufferGoto 9<CR>', {noremap=true})
      map('n', '<S-0>', '<cmd>BufferLast<CR>',   {noremap=true})

    end

  },


    -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-sleuth',
  },



  {
    "rmagatti/auto-session",
    config = function()
      local auto_session = require("auto-session")

      auto_session.setup({
        auto_restore_enabled = false,
        -- auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
      })

      vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
      vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
    end,
  }


}


-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
