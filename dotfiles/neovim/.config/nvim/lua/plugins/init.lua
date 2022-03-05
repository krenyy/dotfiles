require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"ellisonleao/gruvbox.nvim",
		requires = "rktjmp/lush.nvim",
		config = function()
			require("plugins.gruvbox")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		requires = "williamboman/nvim-lsp-installer",
		config = function()
			require("plugins.lspconfig")
		end,
	})

	use({
		"Pocco81/DAPInstall.nvim",
		requires = "mfussenegger/nvim-dap",
		config = function()
			require("plugins.dapinstall")
		end,
	})

	use({
		"rcarriga/nvim-dap-ui",
		requires = "mfussenegger/nvim-dap",
		config = function()
			require("plugins.dap_ui")
		end,
	})

	use({
		"theHamsta/nvim-dap-virtual-text",
		requires = "mfussenegger/nvim-dap",
		config = function()
			require("plugins.dap_virtual_text")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	})

	use("hrsh7th/cmp-vsnip")

	use("hrsh7th/vim-vsnip")

	use("hrsh7th/cmp-nvim-lsp")

	use("hrsh7th/cmp-buffer")

	use("hrsh7th/cmp-path")

	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.cmp")
		end,
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.autopairs")
		end,
	})

	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.bufferline")
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.tree")
		end,
	})

	use({
		"famiu/feline.nvim",
		config = function()
			require("plugins.feline")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plugins.gitsigns")
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("plugins.colorizer")
		end,
	})

	use({
		"sbdchd/neoformat",
		config = function()
			require("plugins.neoformat")
		end,
	})

	use("matze/vim-move")
	use("farmergreg/vim-lastplace")
	use("haya14busa/is.vim")
	use("lambdalisue/suda.vim")
	use("tyru/caw.vim")

	use({
		"phaazon/hop.nvim",
		config = function()
			require("plugins.hop")
		end,
	})

	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("plugins.lsp_signature")
		end,
	})

	use({
		"simrat39/rust-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
		config = function()
			require("plugins.rust_tools")
		end,
	})

	use({
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	})
end)
