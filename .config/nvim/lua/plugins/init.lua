return {
    "christoomey/vim-tmux-navigator",
	"folke/neodev.nvim",
	"michaelb/sniprun",
	"numToStr/Comment.nvim",
	"lukas-reineke/indent-blankline.nvim", -- Indent line
	{"lewis6991/gitsigns.nvim", config = function() require('gitsigns').setup() end },
	{ "windwp/nvim-ts-autotag", config = function() require('nvim-ts-autotag').setup() end }, -- Close HTML tags
	{ "norcalli/nvim-colorizer.lua", config = function() require'colorizer'.setup() end },
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} }, -- Close bracket and quote pairs
	{ "kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
}
