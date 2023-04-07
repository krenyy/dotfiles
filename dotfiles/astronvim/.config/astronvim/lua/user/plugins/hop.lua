return {
  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "BufRead",
    config = function() require("hop").setup() end,
  },
}
