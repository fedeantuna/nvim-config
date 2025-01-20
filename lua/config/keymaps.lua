-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- ignore capitalization mistakes
-- vim.cmd("ca W w")
-- vim.cmd("ca Q q")
-- vim.cmd("ca WQ wq")
-- vim.cmd("ca Wq wq")

