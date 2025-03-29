return {
  "folke/snacks.nvim",
  dependencies = { "echasnovski/mini.icons" },
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        -- stylua: ignore
        keys = {
          { icon = "", key = "f", desc = "Find Files", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = "", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = "", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})", },
          { icon = "󰒲", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = "󱊈", key = "m", desc = "Mason", action = ":Mason", enabled = package.loaded.lazy ~= nil },
          { icon = "", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
░▒▓███████▓▒░░▒▓████████▓▒░▒▓████████▓▒░░▒▓██████▓▒░░▒▓████████▓▒░░▒▓███████▓▒░
       ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░       
       ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░       
 ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓███████▓▒░     ░▒▓█▓▒░░▒▓███████▓▒░ 
░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░    ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░
░▒▓████████▓▒░▒▓████████▓▒░▒▓████████▓▒░░▒▓██████▓▒░     ░▒▓█▓▒░  ░▒▓██████▓▒░ 
        ]],
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
      },
    },
    git = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      matcher = { cwd_bonus = true },
      win = {
        input = {
          keys = {
            ["<c-y>"] = { "confirm", mode = { "n", "i" } },
            ["<up>"] = { "list_up", mode = { "n", "i" } },
            ["<down>"] = { "list_down", mode = { "n", "i" } },
          },
        },
        list = {
          keys = {
            ["<c-y>"] = { "confirm", mode = { "n", "i" } },
            ["<up>"] = { "list_up", mode = { "n", "i" } },
            ["<down>"] = { "list_down", mode = { "n", "i" } },
          },
        },
      },
    },
    quickfile = { enabled = true },
    rename = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  -- stylua: ignore
  keys = {
    -- Picker
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fr", function() Snacks.rename.rename_file() end, desc = "Rename File" },

    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },

    -- Git
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },

    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
  },
  -- init = function()
  --   vim.api.nvim_create_autocmd("User", {
  --     pattern = "VeryLazy",
  --     callback = function() end,
  --   })
  -- end,
}
