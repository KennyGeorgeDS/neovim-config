-- Theme
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.cmd("colorscheme gruvbox")

-- Tab Settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Normal Mode Mappings
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Insert Mode Mappings
vim.keymap.set('i', 'kj', '<ESC>')
vim.keymap.set('i', 'jk', '<ESC>')
vim.wo.number = true
vim.wo.relativenumber = true


