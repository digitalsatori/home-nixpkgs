-- nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter
vim.cmd 'packadd nvim-treesitter'

require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  ignore_install = { 'phpdoc' },
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
}
