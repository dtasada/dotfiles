return {
	"stevearc/oil.nvim",
	opts = {
		keymaps = {
			["<S-k>"] = "actions.parent",
			["<S-j>"] = "actions.select",
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
}
