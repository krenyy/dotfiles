local dap_install = require("dap-install")
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()
local utils = require("utils")
local map = utils.map

for _, debugger in ipairs(dbg_list) do
	dap_install.config(debugger)
end

map("n", "<F5>", ":lua require'dap'.continue()<CR>", { noremap = true, silent = true })
map("n", "<F6>", ":lua require'dap'.terminate()<CR>", { noremap = true, silent = true })
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
map("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })
map(
	"n",
	"<Leader>B",
	":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<Leader>lp",
	":lua require'dap'.set_breakpoint(nil, nil vim.fn.input('Log point message: '))<CR>",
	{ noremap = true, silent = true }
)
map("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>", { noremap = true, silent = true })
map("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>", { noremap = true, silent = true })
