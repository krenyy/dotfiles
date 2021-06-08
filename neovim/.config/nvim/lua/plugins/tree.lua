local options = {
  noremap = true
}


vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', options)
