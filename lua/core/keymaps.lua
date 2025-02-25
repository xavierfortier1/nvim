vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("", "<right>", "<nop>", { noremap = true })
vim.keymap.set("", "<left>", "<nop>", { noremap = true })
vim.keymap.set("", "<CR>", "<nop>", { noremap = true })

vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { silent = true, desc = "Buffer close" })
vim.keymap.set("n", "gV", "`[v`]", { silent = true, desc = "Select last paste area" })
