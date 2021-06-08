require('rooter').setup({
  manual = true,
  echo = true,
  patterns = {
    '.git',
    'package.json',
    'Cargo.toml',
  },
  non_project_files = 'current',
})
