return {
    "stevearc/oil.nvim",
    opts = {
        view_options = {
            show_hidden = true,
        },
        keymaps = {
            ["l"] = "actions.select",
            ["h"] = "actions.parent"
        }
    },
    keys = {
        { "-", mode = "n", "<cmd>Oil --float<CR>", desc = "\u{1F322} Oil" },
    }
}
