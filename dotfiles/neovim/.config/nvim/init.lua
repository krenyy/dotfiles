require'opt'
require'settings'
require'mappings'


require'packer'.startup(function()

  use 'sainnhe/gruvbox-material'

  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'

  use 'windwp/nvim-autopairs'
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

end)


-- Set up treesitter
require'nvim-treesitter.configs'.setup{
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}


-- Set up nvim-cmp
local cmp = require'cmp'

cmp.setup{
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
    { name = 'path' },
  }
}


-- Set up lang servers
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{
      capabilities = require'cmp_nvim_lsp'.update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
    }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end


-- nvim-autopairs
require'nvim-autopairs'.setup{}
require'nvim-autopairs.completion.cmp'.setup{
  auto_select = false
} -- nvim-cmp integration


-- bufferline.nvim
require'bufferline'.setup{}


-- lualine.nvim
require'lualine'.setup{}


-- telescope.nvim
local telescope = require'telescope'

telescope.setup{}
telescope.load_extension('fzf')


-- Set keymaps
-- bufferline.nvim
vim.api.nvim_set_keymap('n', '<A-.>', ':BufferLineCycleNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-,>', ':BufferLineCyclePrev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A->>', ':BufferLineMoveNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-<>', ':BufferLineMovePrev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-c>', ':bd<CR>', { noremap = true })
-- telescope.nvim
vim.api.nvim_set_keymap('n', '<Leader>t', ':Telescope<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files hidden=true<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>la', ':Telescope lsp_code_actions<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ld', ':Telescope lsp_document_diagnostics<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Telescope git_status<CR>', { noremap = true })
-- nvim-tree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {})


-- Format on save
vim.api.nvim_command([[
autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
]])


-- Apply color scheme
local utils = require'utils'
local apply_colorscheme = utils.apply_colorscheme
local apply_globals = utils.apply_globals

apply_globals({
  gruvbox_material_palette = 'material',
  gruvbox_material_background = 'hard',
  gruvbox_material_enable_italic = true,
  gruvbox_material_disable_italic_comment = false,
  gruvbox_material_transparent_background = true,
  gruvbox_material_diagnostic_line_highlight = true,
  gruvbox_material_better_performance = true
})

apply_colorscheme('gruvbox-material', 'dark')

