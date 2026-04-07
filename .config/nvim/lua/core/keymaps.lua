vim.keymap.set("n", "<Bslash>", "<cmd>Oil<cr>", { desc = "Open Oil" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "<C-i>", "<cmd>bn<cr>")
vim.keymap.set("n", "<C-o>", "<cmd>bp<cr>")

vim.keymap.set("x", "<leader>p", [["_dP]]) -- greatest remap ever
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Windows" })

vim.keymap.set("n", "<leader>l",
    function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), { bufnr })
    end,
    { desc = "LSP: enable inlay hints" }
)
