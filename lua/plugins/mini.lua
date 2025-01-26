return {
    {
        "echasnovski/mini.pairs",
        version = false,
        opts = {},
    },
    {
        "echasnovski/mini.icons",
        version = false,
        opts = {},
    },
    {
        "echasnovski/mini.pick",
        version = false,
        opts = {},
        keys = {
            {
                "<leader>F",
                mode = "n",
                function()
                    require("mini.pick").builtin.files()
                end,
                desc = "Find files",
            },
            {
                "<leader>G",
                mode = "n",
                function()
                    require("mini.pick").builtin.grep_live()
                end,
                desc = "Find words",
            },
            {
                "<leader>B",
                mode = "n",
                function()
                    require("mini.pick").builtin.buffers()
                end,
                desc = "Find buffers",
            },
        },
    },
    {
        "echasnovski/mini.clue",
        version = false,
        config = function()
            local miniclue = require("mini.clue")
            miniclue.setup({
                triggers = {
                    -- Leader triggers
                    { mode = "n", keys = "<leader>" },
                    { mode = "x", keys = "<leader>" },

                    -- Built-in completion
                    { mode = "i", keys = "<C-x>" },

                    -- `g` key
                    { mode = "n", keys = "g" },
                    { mode = "x", keys = "g" },

                    -- Marks
                    { mode = "n", keys = "'" },
                    { mode = "n", keys = "`" },
                    { mode = "x", keys = "'" },
                    { mode = "x", keys = "`" },

                    -- Registers
                    { mode = "n", keys = '"' },
                    { mode = "x", keys = '"' },
                    { mode = "i", keys = "<C-r>" },
                    { mode = "c", keys = "<C-r>" },

                    -- Window commands
                    { mode = "n", keys = "<C-w>" },

                    -- `z` key
                    { mode = "n", keys = "z" },
                    { mode = "x", keys = "z" },
                },

                clues = {
                    -- Enhance this by adding descriptions for <Leader> mapping groups
                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),
                },
            })
        end,
    },
}
