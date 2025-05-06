return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-nvim-dap.nvim",
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
          "rust-analyzer",
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
