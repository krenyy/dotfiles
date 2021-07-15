local lsp_config = require('lspconfig')
local on_attach = require('plugins.lspconfig.on_attach')

lsp_config.rust_analyzer.setup({
  on_attach = on_attach
})
