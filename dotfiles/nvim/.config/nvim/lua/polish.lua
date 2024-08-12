-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

--
-- delete below after (if) rustscript ever supported officially
-- :)

local lsp_configs = require "lspconfig.configs"
if not lsp_configs.rscls then
  lsp_configs.rscls = {
    default_config = {
      cmd = { "rscls" },
      filetypes = { "rust-script" },
      root_dir = function(fname) return require("lspconfig").util.path.dirname(fname) end,
    },
    docs = {
      description = [[
https://github.com/MiSawa/rscls

rscls, a language server for rust-script
]],
    },
  }
end

vim.filetype.add {
  pattern = {
    [".*"] = {
      function(path, bufnr)
        local content = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
        if vim.regex([[^#!.*rust-script]]):match_str(content) ~= nil then return "rust-script" end
      end,
      { priority = math.huge },
    },
  },
}
vim.treesitter.language.register("rust", "rust-script")
