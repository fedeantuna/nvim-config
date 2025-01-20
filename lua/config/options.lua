-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = false

-- encoding
vim.opt.encoding = "utf-8"

-- indentation
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.list = true
vim.opt.formatoptions:remove("t")
vim.opt.listchars = "tab:»\\ ,extends:›,precedes:‹,nbsp:·,trail:·"

-- searching/filtering
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- ui
vim.opt.termguicolors = true

-- scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- misc
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"
