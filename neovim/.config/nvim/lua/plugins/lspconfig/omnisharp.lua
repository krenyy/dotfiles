local lsp_config = require('lspconfig')
local on_attach = require('plugins.lspconfig.on_attach')


lsp_config.omnisharp.setup({
  cmd = {
    "/usr/bin/omnisharp",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid())
  },
  on_attach = on_attach
})

