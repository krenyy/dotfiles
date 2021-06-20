local lsp_config = require('lspconfig')
local on_attach = require('plugins.lspconfig.on_attach')

lsp_config.cssls.setup({
  cmd = {"css-languageserver", "--stdio"},
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
})
