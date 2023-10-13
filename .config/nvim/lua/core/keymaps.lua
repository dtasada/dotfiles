-- Generic
vim.keymap.set("n", "<leader>e", "<cmd>wqa<cr>", { desc = "Save all and exit" })
vim.keymap.set("n", "<leader>s", "<cmd>wa<cr>", { desc = "Save all" })
vim.keymap.set("n", "<leader>q", "<cmd>qa!<cr>", { desc = "Exit all without saving" })
vim.keymap.set("n", "<leader>rt", "<cmd>term<cr>", { desc = "Open terminal window" })

vim.keymap.set('n', '<C-l>', "<cmd>BufferNext<cr>", { desc = "Buffer: Cycle to next" })
vim.keymap.set('n', '<C-h>', "<cmd>BufferPrevious<cr>", { desc = "Buffer: Cycle to previous" })
vim.keymap.set('n', '<C-S-l>', "<cmd>BufferMoveNext<cr>", { desc = "Buffer: Swap with next" })
vim.keymap.set('n', '<C-S-h>', "<cmd>BufferMovePrevious<cr>", { desc = "Buffer: Swap with previous" })

vim.keymap.set("n", "J", "mzJ`z") 
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]]) -- greatest remap ever
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", { desc = "Windows" })

-- LSP
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "LSP: Rename variable" })
vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = "LSP: Go to implementation" })
vim.keymap.set('n', '<leader>cr', require('telescope.builtin').lsp_references, { desc = "LSP: Telescope references" })
vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, { desc = "LSP: Show definition" })

-- WhichKey LDR Keys
local which_key_status, which_key = pcall(require, "which-key")
if which_key_status then
	which_key.register({
		gl = { "<cmd>LazyGit<cr>", "Launch LazyGit" },

		b = {
			name = "Buffers",
			c = { "<cmd>BufferClose<cr>",            "Buffer: Close" },
			C = { "<cmd>BufferClose!<cr>",            "Buffer: Force close" },
			s = {
				name = "Sort",
				d = { "<cmd>BufferOrderByDirectory<cr>", "Buffer: Sort by directory" },
				l = { "<cmd>BufferOrderByLanguage<cr>", "Buffer: Sort by language" },
			},
		},

		f = {
			name = "Telescope",
			f = { "<cmd>Telescope find_files<cr>",  "Telescope: Find file" },
			g = { "<cmd>Telescope git_files<cr>",   "Telescope: Find git files" },
			t = { "<cmd>Telescope live_grep<cr>",   "Telescope: Find text" },
			r = { "<cmd>Telescope oldfiles<cr>",    "Telescope: Recent files" },
			l = { "<cmd>Telescope resume<cr>",      "Telescope: Resume last search" },
			c = { "<cmd>Telescope colorscheme<cr>", "Telescope: Pick colorscheme" },
			p = { "<cmd>Telescope projects<cr>",    "Telescope: Projects" },
		},

		P = {
			name = "Plugins",
			l = { "<cmd>Lazy<cr>", "Lazy" },
			m = { "<cmd>Mason<cr>", "Mason" },
		},

		}, { prefix = "<leader>" })
end
