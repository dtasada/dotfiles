vim.keymap.set("n", "<leader>e", "<cmd>wa | qa!<cr>", { desc = "Save all and exit" })
vim.keymap.set("n", "<leader>s", "<cmd>wa<cr>", { desc = "Save all" })
vim.keymap.set("n", "<leader>q", "<cmd>qa!<cr>", { desc = "Exit all without saving" })
vim.keymap.set("n", "<Bslash>", "<cmd>Oil<cr>", { desc = "Open Oil" })

vim.keymap.set("n", "<C-l>", "<cmd>BufferNext<cr>", { desc = "Buffer: Cycle to next" })
vim.keymap.set("n", "<C-h>", "<cmd>BufferPrevious<cr>", { desc = "Buffer: Cycle to previous" })
vim.keymap.set("n", "<C-S-l>", "<cmd>BufferMoveNext<cr>", { desc = "Buffer: Swap with next" })
vim.keymap.set("n", "<C-S-h>", "<cmd>BufferMovePrevious<cr>", { desc = "Buffer: Swap with previous" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]]) -- greatest remap ever
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>", { desc = "Windows" })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename variable" })
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP: Go to implementation" })
vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "LSP: Telescope references" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Show definition" })

vim.keymap.set("n", "<leader>bc", "<cmd>BufferClose<cr>", { desc = "Buffer: Close" })
vim.keymap.set("n", "<leader>bC", "<cmd>BufferClose!<cr>", { desc = "Buffer: Force close" })
vim.keymap.set("n", "<leader>bsd", "<cmd>BufferOrderByDirectory<cr>", { desc = "Buffer: Sort by directory" })
vim.keymap.set("n", "<leader>bsl", "<cmd>BufferOrderByLanguage<cr>",  { desc = "Buffer: Sort by language" })

vim.keymap.set("n", "<leader>ff",  "<cmd>Telescope find_files<cr>",   { desc = "Telescope: Find file" })
vim.keymap.set("n", "<leader>fg",  "<cmd>Telescope git_files<cr>",    { desc = "Telescope: Find git files" })
vim.keymap.set("n", "<leader>ft",  "<cmd>Telescope live_grep<cr>",    { desc = "Telescope: Find text" })
vim.keymap.set("n", "<leader>fr",  "<cmd>Telescope oldfiles<cr>",     { desc = "Telescope: Recent files" })
vim.keymap.set("n", "<leader>fl",  "<cmd>Telescope resume<cr>",       { desc = "Telescope: Resume last search" })

vim.keymap.set("n", "<leader>l", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), { bufnr })
	end, { desc = "LSP: enable inlay hints" })
