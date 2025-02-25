return {
  "mikavilpas/yazi.nvim",
  dependencies = { "folke/snacks.nvim" },
  event = "VeryLazy",
  opts = {
    open_for_directories = true,
    open_multiple_tabs = true,
  },
  keys = {
    { "-", "<cmd>Yazi<cr>", desc = "Open yazi at the current file" },
  },
}
