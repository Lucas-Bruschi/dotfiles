vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Set background and color support
vim.opt.background = "dark"
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "number"
vim.opt.isfname:append("@-@")

-- Disable swapfile that rely on updatetime
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 50 -- Decrease updatetime to improve plugins responsiveness

vim.cmd.colorscheme "gruber-darker"
