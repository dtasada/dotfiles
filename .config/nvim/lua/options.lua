vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.timeout = true
vim.o.timeoutlen = 300
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.o.clipboard = "unnamedplus"

vim.o.cursorline = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.expandtab = true

vim.o.wrap = false
vim.o.colorcolumn = "99"
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ignorecase = true

vim.o.updatetime = 50

vim.o.termguicolors = true
vim.o.background = "dark"

vim.o.mouse = "a"

vim.o.winborder = 'rounded'

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

vim.treesitter.language.add('zag', { path = '/Users/dt/coding/git/zag/tree-sitter-zag/parser.so' })
vim.filetype.add({ extension = { zag = "zag" } })
vim.api.nvim_create_autocmd('FileType', { pattern = { 'zag' }, callback = function(ev) vim.treesitter.start() end, })
