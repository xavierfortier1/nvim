return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
        preview = {
            icon_provider = "mini",
            modes = { "n", "i", "no", "c" },
        },

    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.icons",
    },
}
