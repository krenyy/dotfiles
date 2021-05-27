local lspconfig = require'lspconfig'


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits'
  }
}


lspconfig.clangd.setup{
  capabilities = capabilities
}
lspconfig.html.setup{}
lspconfig.omnisharp.setup{
  cmd = {
    "/usr/bin/omnisharp",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid())
  };
}
lspconfig.rust_analyzer.setup{}
lspconfig.svelte.setup{}
lspconfig.tsserver.setup{}

