return {
    {"echasnovski/mini.nvim", version = false },

    {
        "echasnovski/mini.surround",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            custom_surroundings = nil,

            highlight_duration = 300,

            mappings = {
                add = 'sa',            
                delete = 'ds',         
                find = 'sf',           
                find_left = 'sF',      
                highlight = 'sh',      
                replace = 'sr',        
                update_n_lines = 'sn', 
                suffix_last = 'l',     
                suffix_next = 'n',     
            },

            n_lines = 20,
            respect_selection_type = false,
            search_method = 'cover',
            silent = false,
        },
    },

    -- Get rid of whitespace
    {
        "echasnovski/mini.trailspace",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local miniTrailspace = require("mini.trailspace")

            miniTrailspace.setup({
                only_in_normal_buffers = true,
            })


            vim.keymap.set("n", "<leader>cw", function() miniTrailspace.trim() end, { desc = "Erase Whitespace" })

            -- Ensure highlight never reappears by removing it on CursorMoved
            vim.api.nvim_create_autocmd("CursorMoved", {
                pattern = "*",
                callback = function()
                    require("mini.trailspace").unhighlight()
                end,
            })
        end,


    },
    -- Split & join
    {
        "echasnovski/mini.splitjoin",
        config = function()
            local miniSplitJoin = require("mini.splitjoin")
            miniSplitJoin.setup({
                mappings = { toggle = "" }, -- Disable default mapping
            })
            vim.keymap.set({ "n", "x" }, "sj", function() miniSplitJoin.join() end, { desc = "Join arguments" })
            vim.keymap.set({ "n", "x" }, "sk", function() miniSplitJoin.split() end, { desc = "Split arguments" })
        end,
    },


    {
        'echasnovski/mini.align',
        config=function()
          require('mini.align').setup({
          mappings={
            start='<leader>a',
            start_with_preview='<leader>A'
          }
      })
    end

    },

    --mini jump
    { 
        'echasnovski/mini.jump2d',
        opts={
            mappings={
                start_jumping=","
            }
        }
    },

    --mini ai
    {
        'echasnovski/mini.ai',
        opts={}
    },

    {
        'echasnovski/mini.bracketed',
        opts={}
    },



}