return {
    "pogyomo/submode.nvim",
    lazy = false,
    version="6.*",
    dependencies={
        'folke/todo-comments.nvim'
    },

    config=function()
        local submode = require("submode")
        local resize=require("winresize").resize
        local todo=require("todo-comments")

        submode.create("WinResize", {
            mode = "n",
            enter = "<leader>mw",
            leave = { "q", "<ESC>" },
            default = function(register)

                register("h", function() resize(0, 2, "left") end)
                register("j", function() resize(0, 1, "down") end)
                register("k", function() resize(0, 1, "up") end)
                register("l", function() resize(0, 2, "right") end)

                register("<S-h>", function() 
                    vim.keymap.set("n", "<S-h>", "<C-w>H", { desc = "Move window to the left" })
                end)
                register("<S-l>", function() 
                    vim.keymap.set("n", "<S-l>", "<C-w>L", { desc = "Move window to the right" })
                end)
                register("<S-j>", function() 
                    vim.keymap.set("n", "<S-j>", "<C-w>J", { desc = "Move window to the lower" })
                end)
                register("<S-k>", function() 
                    vim.keymap.set("n", "<S-k>", "<C-w>K", { desc = "Move window to the upper" })
                end)

            end,

        })


        -- submode.create("ToDo",{
        --     mode="n",
        --     enter="<leader>mt",
        --     leave = { "q", "<ESC>" },
        --     default = function(register)

        --         register("j", function()
        --             vim.keymap.set("n", "k", function()
        --                 todo.jump_next()
        --              end,
        --               { desc = "Next dodo" })
        --          end)

        --         register("k", function()
        --             vim.keymap.set("n", "j", function()
        --                 todo.jump_prev()
        --              end,
        --               { desc = "Previous todo" })
        --          end)



        --         register("t", function() vim.api.nvim_command(":TodoTelescope") end)




        --     end,
        -- })

    end



}