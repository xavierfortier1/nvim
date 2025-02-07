return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "saghen/blink.cmp", version = "*" },
    "rafamadriz/friendly-snippets",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
    "echasnovski/mini.icons",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local opts = { buffer = args.buf }

        if client:supports_method("textDocument/hover") then
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end
        if client:supports_method("textDocument/codeAction") then
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end
        if client:supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, opts)

          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end,
          })
        end
      end,
    })

    local blink = require("blink.cmp")
    blink.setup({
      keymap = { preset = "default" },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      completion = {
        menu = {
          draw = {
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                  return kind_icon
                end,
                highlight = function(ctx)
                  local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                  return hl
                end,
              },
            },
          },
        },
      },
    })

    local capabilities =
      vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities())

    require("fidget").setup()
    require("mason").setup()

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
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        neocmake = function()
          local neocmake_capabilities = capabilities
          neocmake_capabilities.textDocument.completion.completionItem.snippetSupport = true

          lspconfig.neocmake.setup({
            capabilities = neocmake_capabilities,
          })
        end,
        lua_ls = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                },
                format = { enable = false },
              },
            },
          })
        end,
        ruff = function()
          local ruff_capabilities = capabilities
          ruff_capabilities.hoverProvider = false

          lspconfig.ruff.setup({
            capabilities = ruff_capabilities,
          })
        end,
        pyright = function()
          lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
              pyright = {
                disableOrganizeImports = true,
              },
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

    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end,
}
