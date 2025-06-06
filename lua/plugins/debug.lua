return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    opts = {
      icons = {
        expanded = "▾",
        collapsed = "▸",
        current_frame = "*",
      },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      vim.api.nvim_set_hl(0, "DapBreak", { fg = "#e51400" })
      vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })

      local breakpoint_icons = {
        Breakpoint = "",
        BreakpointCondition = "",
        BreakpointRejected = "",
        LogPoint = "",
        Stopped = "",
      }

      for type, icon in pairs(breakpoint_icons) do
        local hl = (type == "Stopped") and "DapStop" or "DapBreak"
        vim.fn.sign_define("Dap" .. type, { text = icon, texthl = hl, numhl = hl })
      end

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
    -- stylua: ignore
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Start/Continue" },
      { "<F9>", function() require("dap").step_into() end, desc = "Step Into" },
      { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
      { "<F11>", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Set Breakpoint" },
      { "<F8>", function() require("dapui").toggle() end, desc = "Last session result" },
    },
  },
}
