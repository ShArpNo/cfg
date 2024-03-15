vim.opt.guicursor = ""

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set rnu")
vim.cmd("set nu")

-- undodir
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- enable incsearch
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.g.netrw_banner = 0 -- disable top help menu
vim.g.netrw_liststyle = 3
