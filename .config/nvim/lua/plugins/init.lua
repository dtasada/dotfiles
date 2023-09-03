return {
    "christoomey/vim-tmux-navigator",
	"folke/neodev.nvim",
	"michaelb/sniprun",
	"mbbill/undotree", -- Indent line
	"lukas-reineke/indent-blankline.nvim", -- Indent line
	{ "windwp/nvim-ts-autotag", config = function() require('nvim-ts-autotag').setup() end }, -- Close HTML tags
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} } -- Close bracket and quote pairs
}
