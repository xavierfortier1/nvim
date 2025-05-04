return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local opts = { buffer = args.buf }

          if not client then
            return
          end

          if client:supports_method("textDocument/hover") then
            local hover_opts = vim.tbl_extend("force", opts, { desc = "Hover" })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, hover_opts)
          end
          if client:supports_method("textDocument/rename") then
            local rename_opts = vim.tbl_extend("force", opts, { desc = "Lsp Rename" })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, rename_opts)
          end
          if client:supports_method("textDocument/codeAction") then
            local code_action_opts = vim.tbl_extend("force", opts, { desc = "Code Actions" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, code_action_opts)
          end
        end,
      })

      vim.diagnostic.config({
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
        signs = {
          text = vim.tbl_map(function()
            return ""
          end, vim.diagnostic.severity),
          numhl = {
            [vim.diagnostic.severity.WARN] = "WarningMsg",
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticHint",
          },
        },
        virtual_lines = true,
      })
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "echasnovski/mini.icons",
      "rafamadriz/friendly-snippets",
    },
    version = "*",
    opts = {
      cmdline = {
        completion = {
          ghost_text = { enabled = true },
          menu = { auto_show = true },
        },
      },
      completion = {
        ghost_text = { enabled = true },
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
      signature = {
        enabled = true,
        window = { show_documentation = false },
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
}
