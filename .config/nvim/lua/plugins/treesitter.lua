return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		vim.filetype.add({
			extension = { mcc = "mcc" },
		})

		require("nvim-treesitter.configs").setup({
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		})

		require("nvim-treesitter.parsers").get_parser_configs().mcc = {
			install_info = {
				url = "$HOME/coding/git/mcc/tree-sitter-mcc", -- local path or git URL
				files = { "src/parser.c", "src/scanner.c" }, -- or files needed for build
				-- optional build commands if needed
				generate_requires_npm = false, -- if you don't need npm
				requires_generate_from_grammar = true,
				-- you can add 'branch' or 'revision' if it's a git URL
			},
			filetype = "mcc", -- the filetype you want to associate
		}
		vim.treesitter.language.register("mcc", "mcc") -- the someft filetype will use the python parser and queries.
	end,
}
