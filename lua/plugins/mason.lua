return {
  {
    "mason-org/mason.nvim",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({
        automatic_enable = true,
        automatic_installation = false,
        ensure_installed = {
          "clangd",
          "lua_ls",
          "neocmake",
          "taplo",
          "yamlls",
          "ruff",
          "pyright",
          "jsonls",
          "rust_analyzer",
          "zls",
        },
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      automatic_installation = false,
      ensure_installed = {},
      handlers = {},
    },
  },
}
