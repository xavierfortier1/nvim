return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = { enable = true },
    ensure_installed = {
      "c",
      "cmake",
      "comment",
      "lua",
      "markdown",
      "markdown_inline",
      "html",
      "toml",
      "yaml",
      "json",
      "python",
    },
  },
}
