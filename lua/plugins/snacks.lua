return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    git = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 1000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  --stylua: ignore
  keys = {
    -- Picker
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,                desc = "Find Config File", },
    { "<leader>fb", function() Snacks.picker.buffers() end,                                                desc = "Buffers" },
    { "<leader>ff", function() Snacks.picker.files() end,                                                  desc = "Find Files" },
    { "<leader>fr", function() Snacks.rename.rename_file() end,                                            desc = "Rename File" },

    { "<leader>sb", function() Snacks.picker.lines() end,                                                  desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end,                                           desc = "Grep Open Buffers" },
    { "<leader>sg", function() Snacks.picker.grep() end,                                                   desc = "Grep" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end,                                            desc = "Diagnostics" },
    { "<leader>sq", function() Snacks.picker.qflist() end,                                                 desc = "Quickfix List" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,                                                desc = "Keymaps" },

    -- Git
    { "<leader>gb", function() Snacks.git.blame_line() end,                                                desc = "Git Blame Line" },
    { "<leader>gl", function() Snacks.lazygit() end,                                                       desc = "Lazygit" },

    -- LSP
    { "gd",         function() Snacks.picker.lsp_definitions() end,                                        desc = "Goto Definition" },
    { "gr",         function() Snacks.picker.lsp_references() end,                          nowait = true, desc = "References" },
    { "gI",         function() Snacks.picker.lsp_implementations() end,                                    desc = "Goto Implementation" },
    { "gy",         function() Snacks.picker.lsp_type_definitions() end,                                   desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,                                            desc = "LSP Symbols" },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function() end,
    })
  end,
  dependencies = {
    "echasnovski/mini.icons",
  },
}
