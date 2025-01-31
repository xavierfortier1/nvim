return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local builtins = require("null-ls.builtins")

    null_ls.setup({
      sources = {
        builtins.formatting.clang_format,
        builtins.formatting.stylua,
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
