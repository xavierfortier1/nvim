return {
  "shortcuts/no-neck-pain.nvim",
  opts = {},
  keys = {
    -- stylua: ignore
    { "<leader>nn", mode = "n", function() require("no-neck-pain").toggle() end, desc = "No neck pain" },
  },
}
