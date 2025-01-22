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
}
