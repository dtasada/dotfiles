return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	config = function(_, opts)
		require("lsp_signature").setup({
			bind = true, -- This is mandatory, otherwise border config won't get registered.
			handler_opts = {
				border = "rounded",
			},
		})
	end,
}
