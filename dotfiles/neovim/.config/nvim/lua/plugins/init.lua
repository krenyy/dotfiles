require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"ellisonleao/gruvbox.nvim",
		requires = "rktjmp/lush.nvim",
		config = function()
			require("plugins.gruvbox")
		end,
	})

	use("neovim/nvim-lspconfig")

	use({
		"kabouzeid/nvim-lspinstall",
		config = function()
			require("plugins.lspinstall")
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
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plugins.telescope")
		end,
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		after = "telescope.nvim",
		config = function()
			require("plugins.telescope_fzf_native")
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
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.indent_blankline")
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
end)