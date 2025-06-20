return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required
	},

	config = function()
		local lsp = require("lsp-zero").preset("recommended")
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities()
		)

		require("mason-tool-installer").setup({
			ensure_installed = {
				"black",
				"stylua",
			},
		})

		lsp.ensure_installed({
			"bashls",
			"clangd",
			"cssls",
			"emmet_language_server",
			"gopls",
			"html",
			"kotlin_language_server",
			"lua_ls",
			"rust_analyzer",
			"ts_ls",
		})

		local lspconfig = require("lspconfig")

		require("lspconfig.configs").gdshader_lsp = {
			default_config = {
				name = "gdshader_lsp",
				cmd = { "gdshader-lsp" },
				filetypes = { "gdshader" },
				root_dir = require("lspconfig.util").root_pattern({ "project.godot" }),
			},
		}

		lspconfig.gdshader_lsp.setup({})

		require("lspconfig.configs").sourcekit_lsp = {
			default_config = {
				cmd = { "sourcekit-lsp" },
				filetypes = { "swift" },
				root_dir = require("lspconfig.util").root_pattern({
					"Package.swift",
					"Sources/",
					".*.xcodeproj/",
				}),
			},
		}
		lspconfig.sourcekit_lsp.setup({})

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				omnisharp = function()
					local lspconfig = lspconfig
					lspconfig.omnisharp.setup({
						capabilities = capabilities,
						cmd = { "omnisharp", "--languageserver" },
						root_dir = lspconfig.util.root_pattern("*.sln"),
					})
				end,

				zls = function()
					local lspconfig = lspconfig
					lspconfig.zls.setup({
						root_dir = lspconfig.util.root_pattern("build.zig"),
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
				end,

				clangd = function()
					lspconfig.clangd.setup({
						init_options = {
							fallbackFlags = { "--std=c++23" },
						},
					})
				end,

				denols = function()
					require("lspconfig").denols.setup({
						root_dir = require("lspconfig").util.root_pattern("server/main.ts"),
					})
				end,
			},
		})

		cmp.setup({
			mapping = lsp.defaults.cmp_mappings({
				["<C-n>"] = cmp.mapping.select_next_item(select_opts),
				["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),

				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<cr>"] = cmp.mapping.confirm({ select = true }),
			}),

			sources = {
				{ name = "nvim_lsp" },
				{ name = "copilot" },
				{ name = "nvim_lsp_signature_help" },
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})

		lsp.on_attach(function(client, bufnr)
			local opts = {
				buffer = bufnr,
				remap = false,
			}

			-- vim.keymap.set("n", "<leader>s", function() end, opts)
			-- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
			-- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
			-- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
			-- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
			-- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
			-- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
			-- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
			-- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
			-- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
			-- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		end)

		lsp.setup()
	end,
}
