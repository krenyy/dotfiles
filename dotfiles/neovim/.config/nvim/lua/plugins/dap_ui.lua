local utils = require("utils")
local map = utils.map

require("dapui").setup()

map("n", "<C-d>", ":lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })
