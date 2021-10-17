local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
	local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

	local function on_attach(client, bufnr)
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = true,
			signs = false,
			update_in_insert = false,
		})
	end

	local opts = {
		capabilities = capabilities,
		on_attach = on_attach,
	}

	server:setup(opts)
	-- while nimls not supported by lsp-installer
	require("lspconfig").nimls.setup({})
	--
	vim.cmd([[ do User LspAttachBuffers ]])
end)

local utils = require("utils")
local map = utils.map

local opts = { noremap = true, silent = true }

map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<Leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
map("n", "<Leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
map("n", "<Leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
map("n", "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<Leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
map("n", "<Leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
map("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
