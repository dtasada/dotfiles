return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {},
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

		require("nvim-treesitter.parsers").get_parser_configs().gleam = {
			indent_size = 2,
		}

		require("nvim-treesitter.parsers").get_parser_configs().mcc = {
			install_info = {
				url = "$HOME/coding/git/mcc/tree-sitter-mcc",
				files = { "src/parser.c", "src/scanner.c" },
				generate_requires_npm = false,
				requires_generate_from_grammar = true,
			},
			filetype = "mcc",
		}
		vim.treesitter.language.register("mcc", "mcc")
	end,
}
