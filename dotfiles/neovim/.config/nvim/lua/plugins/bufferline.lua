local bufferline = require('bufferline')


bufferline.setup({})


local options = {
  noremap = true
}

vim.api.nvim_set_keymap('n', '<A-,>', ':BufferLineCyclePrev<CR>', options)
vim.api.nvim_set_keymap('n', '<A-.>', ':BufferLineCycleNext<CR>', options)
vim.api.nvim_set_keymap('n', '<A-<>', ':BufferLineMovePrev<CR>', options)
vim.api.nvim_set_keymap('n', '<A->>', ':BufferLineMoveNext<CR>', options)

vim.api.nvim_set_keymap('n', '<A-c>', ':bd<CR>', options)

