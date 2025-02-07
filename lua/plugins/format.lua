return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-null-ls").setup({
      ensure_installed = { "stylua", "clang-format", "jq" },
      automatic_installation = false,
      handlers = {},
    })

    require("null-ls").setup({
      sources = {
        -- Anything not supported by mason.
      },
    })
  end,
}
