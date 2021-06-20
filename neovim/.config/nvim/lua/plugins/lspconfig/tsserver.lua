local lsp_config = require('lspconfig')
local on_attach = require('plugins.lspconfig.on_attach')

local util = require('lspconfig/util')

lsp_config.tsserver.setup({
  root_dir = function (pattern)
    local cwd = vim.loop.cwd()
    local root = util.root_pattern("package.json", ".git")(pattern)

    return root or cwd
  end,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
})
