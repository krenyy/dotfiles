local utils = require("utils")
local map = utils.map

local telescope = require("telescope")

telescope.load_extension("ui-select")
telescope.load_extension("zf-native")
telescope.setup()

map("n", "<Leader>f", ":Telescope find_files hidden=true<CR>", { noremap = true })
map("n", "<Leader>g", ":Telescope live_grep_raw<CR>", { noremap = true })
