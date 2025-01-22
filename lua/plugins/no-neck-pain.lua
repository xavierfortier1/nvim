return {
    "shortcuts/no-neck-pain.nvim",
    config = function()
        require("no-neck-pain").setup()
    end,
    keys = {
        {
            "<leader>nn",
            mode = "n",
            function()
                require("no-neck-pain").toggle()
            end,
            desc = "No neck pain",
        },
    },
}
