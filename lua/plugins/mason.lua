return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    opts = {},
    config = function(_, opts)
      require("mason").setup(opts)

      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("blink.cmp").get_lsp_capabilities()
      )

      local lspconfig = require("lspconfig")

      require("mason-lspconfig").setup({
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
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({ capabilities = capabilities })
          end,
          neocmake = function()
            local neocmake_capabilities = capabilities
            neocmake_capabilities.textDocument.completion.completionItem.snippetSupport = true
            lspconfig.neocmake.setup({ capabilities = neocmake_capabilities })
          end,
          lua_ls = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each", "Snacks" },
                  },
                  format = { enable = false },
                  workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                  telemetry = { enable = false },
                },
              },
            })
          end,
          ruff = function()
            local ruff_capabilities = capabilities
            ruff_capabilities.hoverProvider = false
            lspconfig.ruff.setup({
              capabilities = ruff_capabilities,
              init_options = {
                settings = { lineLength = 100 },
              },
            })
          end,
          pyright = function()
            lspconfig.pyright.setup({
              capabilities = capabilities,
              settings = {
                pyright = { disableOrganizeImports = true },
                python = {
                  analysis = {
                    ignore = { "*" },
                  },
                },
              },
            })
          end,
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
