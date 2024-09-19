return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"vim",
				"vimdoc",
				"lua",
				"cpp",
				"c",
				"python",
				"javascript",
				"html",
				"css",
				"scss",
				"bash",
				"rust",
				"typescript",
				"tsx",
			},
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				--[[ disable = {
					"markdown",
				} ]]
			},
			indent = {
				enable = true,
			},
		})
	end,
}
