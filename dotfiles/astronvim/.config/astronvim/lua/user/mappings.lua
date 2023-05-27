return {
  n = {
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    [";"] = { "<cmd>HopWord<cr>", desc = "Hop to word" },
    ["<M-j>"] = { "<cmd>MoveLine(1)<cr>", desc = "Move line down" },
    ["<M-k>"] = { "<cmd>MoveLine(-1)<cr>", desc = "Move line up" },
    ["<M-h>"] = { "<cmd>MoveHChar(-1)<cr>", desc = "Move character left" },
    ["<M-l>"] = { "<cmd>MoveHChar(1)<cr>", desc = "Move character right" },
  },
  v = {
    ["<M-j>"] = { "<cmd>MoveBlock(1)<cr>", desc = "Move block down" },
    ["<M-k>"] = { "<cmd>MoveBlock(-1)<cr>", desc = "Move block up" },
    ["<M-h>"] = { "<cmd>MoveHBlock(-1)<cr>", desc = "Move block left" },
    ["<M-l>"] = { "<cmd>MoveHBlock(1)<cr>", desc = "Move block right" },
  },
  t = {},
}
