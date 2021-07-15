local lsp_config = require('lspconfig')
local on_attach = require('plugins.lspconfig.on_attach')


lsp_config.sumneko_lua.setup({
  on_attach = on_attach,
  cmd = {
    "/usr/bin/lua-language-server",
    "-E",
    "/usr/share/lua-language-server/main.lua"
  },
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {
          "vim",
          "describe",
          "it",
          "before_each",
          "after_each",
          "awesome",
          "theme",
          "client"
        }
      }
    }
  }
})
