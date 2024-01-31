-- **** THEME ****
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme gruvbox-baby")


-- **** MODE SETTINGS ****
-- Normal Mode Mappings
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Insert Mode Mappings
vim.keymap.set('i', 'kj', '<ESC>')
vim.keymap.set('i', 'jk', '<ESC>')
vim.opt.number = true
vim.opt.relativenumber = true


-- **** EDITOR SETTINGS ****
-- Tab Settings
vim.cmd [[
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
]]


-- **** NAVIGATION SETTINGS ****
-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
