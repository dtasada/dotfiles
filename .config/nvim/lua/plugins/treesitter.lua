return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp', 'c', 'python', 'javascript', 'html', 'css', 'scss' },
      auto_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end
}
