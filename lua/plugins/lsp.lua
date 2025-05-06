return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
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

      vim.lsp.config("lua_ls", {
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

      local capabilities = require("blink.cmp").get_lsp_capabilities({
        textDocument = {
          completion = {
            completionItem = { snippetSupport = true },
          },
        },
      })
      vim.lsp.config("neocmake", { capabilities = capabilities })

      capabilities = require("blink.cmp").get_lsp_capabilities({ hoverProvider = false })
      vim.lsp.config("ruff", {
        capabilities = capabilities,
        init_options = {
          settings = { lineLength = 100 },
        },
      })

      vim.lsp.config("pyright", {
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
