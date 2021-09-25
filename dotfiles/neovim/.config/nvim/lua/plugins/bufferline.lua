local utils = require("utils")
local map = utils.map

require("bufferline").setup({
	options = {
		indicator_icon = " ",
		offsets = { { filetype = "NvimTree" } },
		show_close_icon = false,
		separator_style = { "", "" },
	},
})

map("n", "<A-.>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
map("n", "<A-,>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
map("n", "<A->>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })
map("n", "<A-<>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })
map("n", "<A-c>", ":bd<CR>", { noremap = true })
