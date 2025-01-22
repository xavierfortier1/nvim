return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
        {
            "-",
            "<cmd>Yazi<cr>",
            desc = "Open yazi at the current file",
        },
    },
    config = function()
        require("yazi").setup({
            open_for_directories = true,
            open_multiple_tabs = true,
        })
    end,
}
