return {
  {
    "smoka7/hop.nvim",
    opts = {},
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            [";"] = { function() require("hop").hint_words() end, desc = "Hop hint words" },
          },
          v = {
            [";"] = { function() require("hop").hint_words { extend_visual = true } end, desc = "Hop hint words" },
          },
        },
      },
    },
  },
  {
    "catppuccin",
    optional = true,
    ---@type CatppuccinOptions
    opts = { integrations = { hop = true } },
  },
}
