return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp', 'c', 'python', 'javascript', 'html', 'css', 'scss', 'bash', 'typescript' },
      auto_install = false,
			sync_install = false,
      highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
      indent = { enable = true },
    }
  end
}
