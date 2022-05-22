local utils = require("utils")
local map = utils.map

local telescope = require("telescope")

telescope.load_extension("ui-select")
telescope.load_extension("zf-native")
telescope.setup()

map("n", "<Leader>f", ":Telescope find_files theme=dropdown hidden=true <CR>", { noremap = true })
map("n", "<Leader>g", ":Telescope live_grep theme=dropdown <CR>", { noremap = true })
