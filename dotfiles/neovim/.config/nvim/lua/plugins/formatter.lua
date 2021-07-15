-- I will use this until formatting from LSP is stable.

local black = function()
  return {
    exe = "black",
    args = {"-"},
    stdin = true
  }
end

local prettier = function()
  return {
    exe = "prettier",
    args = {
      "--stdin-filepath",
      vim.api.nvim_buf_get_name(0),
      "--single-quote"
    },
    stdin = true
  }
end

local shfmt = function()
  return {
    exe = "shfmt",
    args = {},
    stdin = true
  }
end

local rustfmt = function()
  return {
    exe = "rustfmt",
    args = {
      "--emit=stdout"
    },
    stdin = true
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
    python = {
      black
    },
    javascript = {
      prettier
    },
    javascriptreact = {
      prettier
    },
    typescript = {
      prettier
    },
    typescriptreact = {
      prettier
    },
    css = {
      prettier
    },
    less = {
      prettier
    },
    sass = {
      prettier
    },
    scss = {
      prettier
    },
    json = {
      prettier
    },
    graphql = {
      prettier
    },
    markdown = {
      prettier
    },
    vue = {
      prettier
    },
    yaml = {
      prettier
    },
    html = {
      prettier
    },
    sh = {
      shfmt
    },
    rust = {
      rustfmt
    },
  }
})


-- vim.api.nvim_command [[augroup Format]]
-- vim.api.nvim_command [[autocmd! * <buffer>]]
-- vim.api.nvim_command [[autocmd BufWritePost <buffer> FormatWrite]]
-- vim.api.nvim_command [[augroup END]]

-- autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.rs FormatWrite
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * unsilent FormatWrite
augroup END
]], true)
