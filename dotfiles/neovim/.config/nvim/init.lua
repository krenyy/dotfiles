local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = "\\"
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.undofile = true

local plugins = {
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"simrat39/rust-tools.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			require("neodev").setup()
			require("mason-lspconfig").setup({ automatic_installation = true })
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					local lsp_formatting = function(bufnr)
						vim.lsp.buf.format({
							filter = function(client)
								local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
								local method = require("null-ls").methods.FORMATTING
								local supported_by_null_ls = next(
									require("null-ls.sources").get_available(filetype, method)
								) ~= nil
								return (
									(supported_by_null_ls and client.name == "null-ls")
									or ((not supported_by_null_ls) and not (client.name == "null-ls"))
								)
							end,
							bufnr = bufnr,
						})
					end
					local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
					local on_attach = function(client, bufnr)
						if not client.supports_method("textDocument/formatting") then
							return
						end
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								lsp_formatting(bufnr)
							end,
						})

						vim.keymap.set(
							"n",
							"gD",
							vim.lsp.buf.declaration,
							{ noremap = true, silent = true, buffer = bufnr, desc = "LSP: Go to declaration" }
						)
						vim.keymap.set(
							"n",
							"gd",
							vim.lsp.buf.definition,
							{ noremap = true, silent = true, buffer = bufnr, desc = "LSP: Go to definition" }
						)
						vim.keymap.set(
							"n",
							"K",
							vim.lsp.buf.hover,
							{ noremap = true, silent = true, buffer = bufnr, desc = "LSP: Hover" }
						)
						vim.keymap.set(
							"n",
							"gi",
							vim.lsp.buf.implementation,
							{ noremap = true, silent = true, buffer = bufnr, desc = "LSP: Go to implementation" }
						)
						vim.keymap.set(
							"n",
							"<leader>wa",
							vim.lsp.buf.add_workspace_folder,
							{ noremap = true, silent = true, buffer = bufnr, desc = "Workspace: Add folder" }
						)
						vim.keymap.set(
							"n",
							"<leader>wr",
							vim.lsp.buf.remove_workspace_folder,
							{ noremap = true, silent = true, buffer = bufnr, desc = "Workspace: Remove folder" }
						)
						vim.keymap.set("n", "<leader>wl", function()
							print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
						end, { noremap = true, silent = true, buffer = bufnr, desc = "Workspace: List folders" })
						vim.keymap.set(
							"n",
							"<leader>D",
							vim.lsp.buf.type_definition,
							{ noremap = true, silent = true, buffer = bufnr, desc = "LSP: Go to type definition" }
						)
						vim.keymap.set(
							"n",
							"<leader>rn",
							vim.lsp.buf.rename,
							{ noremap = true, silent = true, buffer = bufnr, desc = "LSP: Rename" }
						)
						vim.keymap.set(
							"n",
							"<leader>ca",
							vim.lsp.buf.code_action,
							{ noremap = true, silent = true, buffer = bufnr, desc = "LSP: Code action" }
						)
						vim.keymap.set(
							"n",
							"gr",
							vim.lsp.buf.references,
							{ noremap = true, silent = true, buffer = bufnr, desc = "LSP: References" }
						)
						vim.keymap.set("n", "<leader>cf", function()
							vim.lsp.buf.format({ async = true })
						end, { noremap = true, silent = true, buffer = bufnr, desc = "LSP: Format" })
					end
					require("lspconfig")[server_name].setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
						on_attach = on_attach,
					})
				end,
				["rust_analyzer"] = function()
					require("rust-tools").setup()
				end,
			})
			vim.keymap.set(
				"n",
				"<leader>e",
				vim.diagnostic.open_float,
				{ noremap = true, silent = true, desc = "Diagnostic: Open float" }
			)
			vim.keymap.set(
				"n",
				"[d",
				vim.diagnostic.goto_prev,
				{ noremap = true, silent = true, desc = "Diagnostic: Go to previous" }
			)
			vim.keymap.set(
				"n",
				"]d",
				vim.diagnostic.goto_next,
				{ noremap = true, silent = true, desc = "Diagnostic: Go to next" }
			)
			vim.keymap.set(
				"n",
				"<leader>q",
				vim.diagnostic.setloclist,
				{ noremap = true, silent = true, desc = "Diagnostic: List" }
			)
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
			vim.diagnostic.config({ float = { border = "single" } })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		config = function()
			require("mason")
			require("mason-null-ls").setup({
				automatic_setup = true,
			})
			require("null-ls").setup()

			require("mason-null-ls").setup_handlers()
		end,
		dependencies = { { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } } },
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"natecraddock/telescope-zf-native.nvim",
		},
		config = function()
			require("telescope").load_extension("zf-native")
			local builtin = require("telescope.builtin")
			vim.keymap.set(
				"n",
				"<leader>f",
				builtin.find_files,
				{ noremap = true, silent = true, desc = "Telescope: Find files" }
			)
			vim.keymap.set(
				"n",
				"<leader>g",
				builtin.live_grep,
				{ noremap = true, silent = true, desc = "Telescope: Live grep" }
			)
			vim.keymap.set(
				"n",
				"<leader>b",
				builtin.buffers,
				{ noremap = true, silent = true, desc = "Telescope: Buffers" }
			)
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			vim.o.background = "dark"
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"saecki/crates.nvim",
		-- tag = "v0.3.0",
		event = { "BufRead Cargo.toml", "BufWritePre Cargo.toml" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-git",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-path",

			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("snippy").expand_snippet(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "buffer" },
					{ name = "cmdline" },
					{ name = "crates" },
					{ name = "git" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "path" },
					{ name = "snippy" },
				}),
			})
		end,
	},
	{
		"folke/noice.nvim",
		config = function()
			require("nvim-treesitter.install").ensure_installed(
				"vim",
				"regex",
				"lua",
				"bash",
				"markdown",
				"markdown_inline"
			)
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
			require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup()
			vim.keymap.set("n", "]b", function()
				bufferline.cycle(1)
			end, { noremap = true, silent = true, desc = "Bufferline: Cycle next" })
			vim.keymap.set("n", "[b", function()
				bufferline.cycle(-1)
			end, { noremap = true, silent = true, desc = "Bufferline: Cycle previous" })
			vim.keymap.set("n", "}", function()
				bufferline.move(1)
			end, { noremap = true, silent = true, desc = "Bufferline: Move next" })
			vim.keymap.set("n", "{", function()
				bufferline.move(-1)
			end, { noremap = true, silent = true, desc = "Bufferline: Move previous" })
			vim.keymap.set("n", "<leader>d", function()
				vim.cmd([[bd]])
			end, { noremap = true, silent = true, desc = "Bufferline: Close" })
			vim.keymap.set("n", "<leader>D", function()
				vim.cmd([[bd!]])
			end, { noremap = true, silent = true, desc = "Bufferline: Close (force)" })
		end,
	},
	{ "vladdoster/remember.nvim", config = [[ require('remember') ]] },
	{
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			local hop = require("hop")
			hop.setup()
			vim.keymap.set("n", ";", function()
				hop.hint_words()
			end, { noremap = true, silent = true, desc = "Hop: Word" })
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set("n", "<C-n>", function()
				require("nvim-tree.api").tree.toggle()
			end, { noremap = true, silent = true, desc = "Tree: Toggle" })
		end,
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
