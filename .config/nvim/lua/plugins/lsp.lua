return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"folke/neodev.nvim",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"hrsh7th/nvim-cmp",
		"hrsh7th/vim-vsnip",
		"neovim/nvim-lspconfig",
		"saadparwaiz1/cmp_luasnip",
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
	},

	config = function()
		local lsp = require("lsp-zero").preset("recommended")
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
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
				{ name = "buffer" },
				{ name = "path" },
				{ name = "luasnip" },
				-- { name = "nvim_lua" },
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
		end)

		lsp.setup({})
	end,
}
