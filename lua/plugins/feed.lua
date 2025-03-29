return {
  "neo451/feed.nvim",
  cmd = "Feed",
  opts = {
    feeds = {
      "https://neovim.io/news.xml",
      "https://www.segger.com/rss.xml",
      "github://abenz1267/walker/releases",
    },
    ui = {
      tags = {
        color = "String",
        format = function(id, db)
          local get_icon = function(name)
            local has_mini, MiniIcons = pcall(require, "mini.icons")
            if has_mini then
              local icon = MiniIcons.get("filetype", name)
              if icon then
                return icon .. " "
              end
            end
            return name
          end

          local tags = vim.tbl_map(get_icon, db:get_tags(id))
          table.sort(tags)
          return "[" .. table.concat(tags, ", ") .. "]"
        end,
      },
    },
  },
}
