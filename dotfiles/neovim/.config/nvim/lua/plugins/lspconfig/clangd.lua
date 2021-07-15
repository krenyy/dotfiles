local lsp_config = require('lspconfig')
local on_attach = require('plugins.lspconfig.on_attach')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits'
  }
}


lsp_config.clangd.setup({
  capabilities = capabilities,
  on_attach = on_attach
})

