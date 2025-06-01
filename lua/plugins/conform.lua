return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      python = { "ruff_format" },
      yaml = { "yamlfmt" },
      json = { "jq" },
      rust = { "rustfmt" },
      toml = { "taplo" },
      bitbake = { "oelint_adv" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters = {
      oelint_adv = {
        meta = {
          url = "https://github.com/priv-kweihmann/oelint-adv",
          description = "Advanced OpenEmbedded Style guide",
        },
        command = "oelint-adv",
        args = {
          "--quiet",
          "--messageformat={path}:{line}:{severity}:{id}:{msg}",
        },
        stdin = false,
      },
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        conform.format({ bufnr = args.buf })
      end,
    })
  end,
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
