local lsp_config = require("lspconfig")
local lsp = vim.lsp
local fn = vim.fn


lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      prefix = "●",
      spacing = 4,
    }
  }
)


fn.sign_define("LspDiagnosticsSignError", { text = "🞮", numhl = "LspDiagnosticsDefaultError" })
fn.sign_define("LspDiagnosticsSignWarning", { text = "▲", numhl = "LspDiagnosticsDefaultWarning" })
fn.sign_define("LspDiagnosticsSignInformation", { text = "⁈", numhl = "LspDiagnosticsDefaultInformation" })
fn.sign_define("LspDiagnosticsSignHint", { text = "⯁", numhl = "LspDiagnosticsDefaultHint" })

require('plugins.lspconfig.bashls')
require('plugins.lspconfig.clangd')
require('plugins.lspconfig.cssls')
require('plugins.lspconfig.html')
require('plugins.lspconfig.jsonls')
require('plugins.lspconfig.omnisharp')
require('plugins.lspconfig.rust_analyzer')
require('plugins.lspconfig.sqlls')
require('plugins.lspconfig.sumneko_lua')
require('plugins.lspconfig.tsserver')
require('plugins.lspconfig.vimls')

-- Format file on save
-- vim.api.nvim_command([[
  -- autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
-- ]])

