return {
  "williamboman/mason.nvim",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        local capabilities = vim.tbl_deep_extend(
          "force",
          {},
          vim.lsp.protocol.make_client_capabilities(),
          require("blink.cmp").get_lsp_capabilities()
        )

        local lspconfig = require("lspconfig")

        require("mason-lspconfig").setup({
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
                  },
                },
              })
            end,
            ruff = function()
              local ruff_capabilities = capabilities
              ruff_capabilities.hoverProvider = false
              lspconfig.ruff.setup({ capabilities = ruff_capabilities })
            end,
            pyright = function()
              lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                  pyright = { disableOrganizeImports = true },
                  python = {
                    analysis = { ignore = { "*" } },
                  },
                },
              })
            end,
          },
        })
      end,
    },
    {
      "jay-babu/mason-null-ls.nvim",
      opts = {
        ensure_installed = {

          "stylua",
          "clang-format",
          "jq",
        },
        automatic_installation = false,
        handlers = {},
      },
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      opts = {
        ensure_installed = {},
        automatic_installation = false,
        handlers = {},
      },
    },
  },
  opts = {},
}
