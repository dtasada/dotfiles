return {
    "christoomey/vim-tmux-navigator",
	"folke/neodev.nvim",
	"michaelb/sniprun",
	"lukas-reineke/indent-blankline.nvim", -- Indent line
	{"lewis6991/gitsigns.nvim", config = function() require('gitsigns').setup() end },
	{ "windwp/nvim-ts-autotag", config = function() require('nvim-ts-autotag').setup() end }, -- Close HTML tags
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} }, -- Close bracket and quote pairs
}
