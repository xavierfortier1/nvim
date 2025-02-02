return {
  "OXY2DEV/markview.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.icons",
  },
  lazy = false,
  opts = {
    preview = {
      icon_provider = "mini",
      modes = { "n", "i", "no", "c" },
    },
  },
}
