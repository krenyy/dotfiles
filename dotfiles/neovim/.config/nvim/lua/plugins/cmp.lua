local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<CR>"] = cmp.mapping.confirm(),
	},
	sources = {
		{ name = "buffer" },
		{ name = "crates" },
		{ name = "nvim_lsp" },
		{ name = "omni" },
		{ name = "path" },
		{ name = "vsnip" },
	},
})
