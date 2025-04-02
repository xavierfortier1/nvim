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
          if client:supports_method("textDocument/formatting") then
            local format_opts = vim.tbl_extend("force", opts, { desc = "Format Buffers" })
            vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, format_opts)

            vim.api.nvim_create_autocmd("BufWritePre", {
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                -- vim.lsp.buf.format(opts)
              end,
            })
          end
        end,
      })

      local virt_text, virt_lines
      vim.api.nvim_create_autocmd({ "CursorMoved", "DiagnosticChanged" }, {
        callback = function()
          local buf = vim.api.nvim_get_current_buf()
          local ft = { "lazy", "TelescopePrompt", "neo-tree" }
          if vim.tbl_contains(ft, vim.bo[buf].filetype) then
            return
          end

          if not virt_lines then
            virt_lines = vim.diagnostic.config().virtual_lines
          end

          if not (virt_lines and virt_lines.current_line) then
            if virt_text then
              vim.diagnostic.config({ virtual_text = virt_text })
              virt_text = nil
            end
            return
          end

          if not virt_text then
            virt_text = vim.diagnostic.config().virtual_text
          end

          local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1

          if vim.tbl_isempty(vim.diagnostic.get(0, { lnum = lnum })) then
            vim.diagnostic.config({ virtual_text = virt_text })
          else
            vim.diagnostic.config({ virtual_text = false })
          end
        end,
      })

      vim.api.nvim_create_autocmd("ModeChanged", {
        callback = function()
          pcall(vim.diagnostic.show)
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
        virtual_text = true,
        virtual_lines = { current_line = true },
        severity_sort = true,
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
    config = true,
  },
}
