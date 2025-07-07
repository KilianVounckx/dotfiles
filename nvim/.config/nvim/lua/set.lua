vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80,100"

vim.opt.list = true
vim.opt.listchars = "eol:↵,tab:→·,lead:·,trail:·,nbsp:⍽,extends:◣,precedes:◢"

vim.opt.relativenumber = false

vim.opt.whichwrap:append({
    ["h"] = true,
    ["l"] = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.opt.shell = "nu"
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

vim.filetype.add({
    extension = {
        bqn = "bqn",
        ua = "uiua",
        kk = "koka",
        flix = "flix",
        res = "rescript",
    },
})

vim.o.autoread = true
vim.api.nvim_create_autocmd({
    "BufEnter",
    "CursorHold",
    "CursorHoldI",
    "FocusGained",
}, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = "*",
})
