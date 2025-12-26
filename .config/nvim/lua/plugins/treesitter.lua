return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "master",
    build = ":TSUpdate",

    config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
                additional_vim_regex_highlighting = false,
			},
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<A-o>",
                    node_incremental = "<A-o>",
                    scope_incremental = "<A-O>",
                    node_decremental = "<A-i>",
                },
            },
		})

		require("nvim-treesitter.parsers").get_parser_configs().zag = {
			install_info = {
				url = "/Users/dt/coding/git/zag/tree-sitter-zag",
				files = { "src/parser.c" },
			},
			filetype = "zag",
		}

        vim.filetype.add({ extension = { zag = "zag" } })
		vim.treesitter.language.register("zag", "zag")
    end,
}
