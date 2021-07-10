return require('packer').startup(function()
  local plenary = {
    'nvim-lua/plenary.nvim'
  }
  local popup = {
    'nvim-lua/popup.nvim'
  }
  local devicons = {
    'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.devicons') end
  }

  use 'wbthomason/packer.nvim'

  use {
    'famiu/nvim-reload',
    requires = plenary
  }

  use 'sainnhe/gruvbox-material'
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = devicons,
    config = function() require('plugins.galaxyline') end
  }

  use 'farmergreg/vim-lastplace'
  use 'haya14busa/is.vim'
  use 'matze/vim-move'
  use 'lambdalisue/suda.vim'
  use 'tyru/caw.vim'
  use 'vim-test/vim-test'
  use 'jiangmiao/auto-pairs'

  use {
    'luochen1990/rainbow',
    config = function() vim.g['rainbow_active'] = 1 end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = plenary,
    config = function() require('plugins.gitsigns') end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = devicons,
    config = function() require('plugins.tree') end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('plugins.indent-blankline') end
  }

  use {
    'hrsh7th/nvim-compe',
    config = function() require('plugins.compe') end
  }

  use {
    'mhartington/formatter.nvim',
    config = function() require('plugins.formatter') end
  }

  -- use {
  --   'nvim-telescope/telescope.nvim',
  --   requires = { plenary, popup },
  --   config = function() require('plugins.telescope') end
  -- }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      {
        'nvim-treesitter/completion-treesitter',
        run = function() vim.cmd [[TSUpdate]] end
      }
    },
    config = function() require('plugins.treesitter') end
  }

  use {
    'oberblastmeister/rooter.nvim',
    config = function() require('plugins.rooter') end
  }

  use {
    'tpope/vim-fugitive',
    config = function() require('plugins.fugitive') end
  }

  use {
    'phaazon/hop.nvim',
    config = function() require('plugins.hop') end
  }

  use {
    'akinsho/nvim-bufferline.lua',
    requires = devicons,
    config = function() require('plugins.bufferline') end
  }

  use {
    'onsails/lspkind-nvim',
    config = function() require('plugins.lspkind') end
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function() require('plugins.lsp_signature') end
  }

  use {
    'folke/trouble.nvim',
    requires = {
      devicons,
      'folke/lsp-colors.nvim'
    },
    config = function() require('plugins.trouble') end
  }

  use 'mattn/emmet-vim'
  

  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig') end
  }

end)

