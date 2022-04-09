local utils = require("utils")
local map = utils.map

local telescope = require("telescope")

telescope.setup()
telescope.load_extension("fzf")
telescope.load_extension("ui-select")

map("n", "<Leader>t", ":Telescope<CR>", { noremap = true })
map("n", "<Leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true })
map("n", "<Leader>fg", ":Telescope live_grep<CR>", { noremap = true })
map("n", "<Leader>fb", ":Telescope buffers<CR>", { noremap = true })
map("n", "<Leader>fh", ":Telescope help_tags<CR>", { noremap = true })
map("n", "<Leader>la", ":Telescope lsp_code_actions<CR>", { noremap = true })
map("n", "<Leader>ld", ":Telescope lsp_document_diagnostics<CR>", { noremap = true })
map("n", "<Leader>gs", ":Telescope git_status<CR>", { noremap = true })
