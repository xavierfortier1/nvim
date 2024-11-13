return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = 'nvim-treesitter.configs',
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = { enable = true },
            ensure_installed = {
                "c",
                "kconfig",
                "devicetree",
                "cmake",
                "comment",
                "lua",
                "markdown",
                "markdown_inline",
                "html",
                "toml",
                "yaml",
                "json",
                "python"
            }
        })
    end
}
