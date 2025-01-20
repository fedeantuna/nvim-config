-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ignore capitalization mistakes
vim.cmd("ca W w")
vim.cmd("ca Q q")
vim.cmd("ca WQ wq")
vim.cmd("ca Wq wq")

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")
vim.keymap.set("n", "<leader>ml", ":b#<cr>")

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
