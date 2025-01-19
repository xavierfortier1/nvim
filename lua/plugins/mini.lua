return {
    {
        "echasnovski/mini.pairs",
        version = false,
        opts = {}
    },
    {
        "echasnovski/mini.icons",
        version = false,
        opts = {}
    },
    {
        "echasnovski/mini.pick",
        version = false,
        opts = {},
        keys = {
            {
                "<leader>f",
                mode = "n",
                function() MiniPick.builtin.files() end,
                desc = "Find files"
            },
            {
                "<leader>g",
                mode = "n",
                function() MiniPick.builtin.grep_live() end,
                desc = "Find words"
            },
            {
                "<leader>b",
                mode = "n",
                function() MiniPick.builtin.buffers() end,
                desc = "Find buffers"
            },
        }
    }
}
