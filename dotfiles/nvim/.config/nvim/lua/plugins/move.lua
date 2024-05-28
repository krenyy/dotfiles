return {
  {
    "fedepujol/move.nvim",
    opts = {},
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<A-j>"] = { "<cmd>MoveLine(1)<cr>", desc = "Move line down" },
            ["<A-k>"] = { "<cmd>MoveLine(-1)<cr>", desc = "Move line up" },
          },
        },
      },
    },
  },
}
