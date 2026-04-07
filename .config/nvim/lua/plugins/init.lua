require("plugins.lsp")

vim.pack.add({
	"https://github.com/DrKJeff16/project.nvim",
	"https://github.com/MagicDuck/grug-far.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/norcalli/nvim-colorizer.lua",
	"https://github.com/numToStr/Comment.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/rose-pine/neovim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/windwp/nvim-autopairs",
    "https://github.com/ibhagwan/fzf-lua",
})

require("Comment").setup({ toggler = { line = "gcc" } })
require("gitsigns").setup()
require("colorizer").setup()
require("nvim-autopairs").setup({})
require("grug-far").setup({})
require("conform").setup({
	format_on_save = {
		async = false,
		timeout_ms = 500,
	},
	formatters = {
		["clang-format"] = {
			args = "-style=file:$HOME/.clang-format",
		},
	},
})
require("oil").setup({
	keymaps = {
		["<S-k>"] = "actions.parent",
		["<S-j>"] = "actions.select",
	},
})
require("project").setup({
	patterns = {".git"},
	fzf_lua = { enabled = true },
})

require("telescope").load_extension('projects')
require("telescope").load_extension("fzf")
require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

local tsb = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff",  tsb.find_files,   { desc = "Telescope: Find file" })
vim.keymap.set("n", "<leader>fg",  tsb.git_files,    { desc = "Telescope: Find git files" })
vim.keymap.set("n", "<leader>ft",  tsb.live_grep,    { desc = "Telescope: Find text" })
vim.keymap.set("n", "<leader>fr",  tsb.oldfiles,     { desc = "Telescope: Recent files" })
vim.keymap.set("n", "<leader>fl",  tsb.resume,       { desc = "Telescope: Resume last search" })
vim.keymap.set("n", "<leader>fb",  tsb.buffers,       { desc = "Telescope: Buffers" })
vim.keymap.set("n", "<leader>fp",  "<cmd>ProjectTelescope<cr>", { desc = "Telescope: projects" })


vim.cmd("colorscheme rose-pine-moon")
