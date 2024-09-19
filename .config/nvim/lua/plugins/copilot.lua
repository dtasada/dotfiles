return {
	"zbirenbaum/copilot.lua",
	dependencies = { "zbirenbaum/copilot-cmp" },
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
			},
			panel = { enabled = false },
		})

		require("copilot_cmp").setup({})
	end,
}
