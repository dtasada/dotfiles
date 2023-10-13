return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = {
				'vim',
				'vimdoc',
				'lua',
				'cpp',
				'c',
				'python',
				'javascript',
				'html',
				'css',
				'scss',
				'bash',
				'rust',
				'typescript',
				'tsx'
			},
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		}
	end
}
