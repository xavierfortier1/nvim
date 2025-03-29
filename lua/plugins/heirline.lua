return {
  {
    "rebelot/heirline.nvim",
    dependencies = { "zeioth/heirline-components.nvim" },
    event = "UiEnter",
    opts = function()
      local lib = require("heirline-components.all")

      return {
        opts = {
          disable_winbar_cb = function(args)
            local is_disabled = not require("heirline-components.buffer").is_valid(args.buf)
              or lib.condition.buffer_matches({
                buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
                filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
              }, args.buf)
            return is_disabled
          end,
        },
        statusline = {
          hl = { fg = "fg", bg = "bg" },
          lib.component.mode(),
          lib.component.git_branch(),
          lib.component.file_info({
            filename = {},
            filetype = false,
            file_modified = {},
          }),
          lib.component.diagnostics(),
          lib.component.fill(),
          lib.component.cmd_info(),
          lib.component.fill(),
          lib.component.lsp({ lsp_progress = false }),
          lib.component.virtual_env(),
          -- lib.component.nav(),
          lib.component.mode({ surround = { separator = "right" } }),
        },
      }
    end,
    config = function(_, opts)
      local heirline = require("heirline")
      local heirline_components = require("heirline-components.all")

      heirline_components.init.subscribe_to_events()
      heirline.load_colors(heirline_components.hl.get_colors())
      heirline.setup(opts)
    end,
  },
  {
    "zeioth/heirline-components.nvim",
    config = true,
  },
}
