return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",         -- required
		"nvim-telescope/telescope.nvim", -- optional
		"sindrets/diffview.nvim",        -- optional
		"ibhagwan/fzf-lua",              -- optional
	},
	config = function()
		require("neogit").setup({
			kind = "floating", -- opens neogit in a split 
			signs = {
				-- { CLOSED, OPENED }
				section = { "", "" },
				item = { "", "" },
				hunk = { "", "" },
			},
			integrations = { diffview = true }, -- adds integration with diffview.nvim
		})
	end,
}
