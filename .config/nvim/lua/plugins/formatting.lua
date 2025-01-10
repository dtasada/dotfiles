return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},

			formatters_by_ft = {
				python = { "black" },
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				java = { "clang-format" },
			},

			formatters = {
				["clang-format"] = {
					args = "-style='{IndentWidth: 4}'",
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end)
	end,
}
