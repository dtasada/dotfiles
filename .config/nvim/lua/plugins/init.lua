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
		"windwp/nvim-ts-autotag", -- Close HTML tags
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
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
	{
		"MeanderingProgrammer/markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		config = function()
			require("render-markdown").setup({})
		end,
	},
	{
		"romgrk/barbar.nvim",
		dependencies = { "lewis6991/gitsigns.nvim", "nvim-tree/nvim-web-devicons" },
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {},
	},
	{ -- see lsp as you type
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
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
