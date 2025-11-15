return {
	-- common dependencies
	"nvim-tree/nvim-web-devicons",
	"nvim-treesitter/nvim-treesitter",

	{ "numToStr/Comment.nvim", config = function() require("Comment").setup({ toggler = { line = "gcc" } }) end, },
	{ "windwp/nvim-ts-autotag", config = function() require("nvim-ts-autotag").setup() end, },
	{ "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end, },
	{ "norcalli/nvim-colorizer.lua", config = function() require("colorizer").setup() end, },
	{ "lukas-reineke/indent-blankline.nvim", config = function() require("ibl").setup({ scope = { highlight = "Whitespace" } }) end, }, -- Indent line
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} }, -- Close bracket and quote pairs
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "folke/trouble.nvim", opts = {}, cmd = "Trouble", },
	{ "MeanderingProgrammer/markdown.nvim", config = function() require("render-markdown").setup({}) end, },
	{ "romgrk/barbar.nvim", init = function() vim.g.barbar_auto_setup = false end, opts = {}, },
	{
		"ray-x/lsp_signature.nvim", event = "VeryLazy",
		config = function()
			require("lsp_signature").setup({
				hint_enable = false,
			})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
}
