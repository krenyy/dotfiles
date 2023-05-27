return {
  {
    "phaazon/hop.nvim",
    branch = "v2",
    lazy = false,
    config = function() require("hop").setup() end,
  },
}
