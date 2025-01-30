return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = { "LazyGit" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>lg", mode = "n", "<cmd>LazyGit<cr>", desc = "Lazygit" },
    },
}
