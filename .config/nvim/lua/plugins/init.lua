return {
	"christoomey/vim-tmux-navigator",
	"folke/neodev.nvim",
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "akinsho/toggleterm.nvim", config = true },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({ toggler = { line = "gcc" } })
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	}, -- Close HTML tags
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({ scope = { highlight = "Whitespace" } })
		end,
	}, -- Indent line
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} }, -- Close bracket and quote pairs
	{ "nvim-treesitter/nvim-treesitter", dependencies = { { "nushell/tree-sitter-nu" } }, build = ":TSUpdate" },
}
