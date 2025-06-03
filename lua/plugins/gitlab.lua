return {
  {
    "gitlab-org/editor-extensions/gitlab.vim.git",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "bitbake", "python", "c", "cpp", "rust", "zig" },
    opts = {},
    keys = {
      { "<leader>gl", "<Plug>(GitLabToggleCodeSuggestions)", desc = "Toggle Duo Code Suggestions" },
    },
    init = function()
      vim.o.completeopt = "menu,menuone"
    end,
    cond = function()
      return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ""
    end,
  },
}
