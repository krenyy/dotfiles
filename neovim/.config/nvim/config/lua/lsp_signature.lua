cfg = {
  bind = true,

  doc_lines = 10,

  hint_enable = false,
  hint_prefix = "🐼 ",
  hint_scheme = "String",

  handler_opts = {
    border = "none"
  },
  decorator = {"`", "`"}
}


require'lsp_signature'.on_attach(cfg)

