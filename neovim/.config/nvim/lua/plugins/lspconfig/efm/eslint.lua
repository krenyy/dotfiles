return {
  lintCommand = 'eslint --stdin --stdin-filename ${INPUT} -f unix',
  lintStdin = true,
  lintIgnoreExitCode = true
}
