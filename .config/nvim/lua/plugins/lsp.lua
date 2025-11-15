return {
	"neovim/nvim-lspconfig",

	dependencies = {
		{ "mason-org/mason.nvim" },
		{ "mason-org/mason-lspconfig.nvim" },

		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},

	config = function()
		vim.diagnostic.config({ virtual_text = true })

		require("mason").setup({})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name) vim.lsp.config[server_name].setup({}) end,

				omnisharp = function()
					vim.lsp.config.omnisharp.setup({
						cmd = { "omnisharp", "--languageserver" },
						root_dir = vim.lsp.config.util.root_pattern("*.sln"),
					})
				end,

				zls = function()
					vim.lsp.config.zls.setup({
						root_dir = vim.lsp.config.util.root_pattern("build.zig"),
						settings = {
							zls = {
								enable_inlay_hints = true,
								enable_snippets = true,
								warn_style = true,
							},
						},
					})
					vim.g.zig_fmt_parse_errors = 1
					vim.g.zig_fmt_autosave = 1
					-- vim.g.zig_enable_build_on_save = 1
					-- vim.g.zig_build_on_save_step = "check"
				end,

				--[[ clangd = function()
					vim.lsp.config.clangd.setup({
						init_options = {
							fallbackFlags = { "--std=c++23" },
						},
					})
				end, ]]

				denols = function()
					vim.lsp.config.denols.setup({
						root_dir = vim.lsp.config.util.root_pattern("server/main.ts"),
					})
				end,

				gleam = function()
					vim.lsp.config.gleam.setup({})
				end,

				gdshader_lsp = function() 
					vim.lsp.config.gd_shader_lsp.setup({
						name = "gdshader_lsp",
						cmd = { "gdshader-lsp" },
						filetypes = { "gdshader" },
						root_dir = vim.lsp.config.util.root_pattern({ "project.godot" }),
						-- root_dir = require("lspconfig.util").root_pattern({ "project.godot" }),
					})
				end,

				sourcekit_lsp = function() 
					vim.lsp.config.sourcekit_lsp.setup({
						cmd = { "sourcekit-lsp" },
						filetypes = { "swift" },
						-- root_dir = require("lspconfig.util").root_pattern({
						root_dir = vim.lsp.config.util.root_pattern({
							"Package.swift",
							"Sources/",
							".*.xcodeproj/",
						}),
					})
				end,
			},
		})

		local cmp = require("cmp")
		cmp.setup({
			mapping = {
				["<C-n>"] = cmp.mapping.select_next_item(select_opts),
				["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),

				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<cr>"] = cmp.mapping.confirm({ select = true }),
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			sources = { { name = "nvim_lsp" } },
		})
	end,
}
