-- Move visually highlighted lines up and down
vim.keymap.set('v', 'K', ":move '<-2<CR>gv-gv")
vim.keymap.set('v', 'J', ":move '>+1<CR>gv-gv")

vim.keymap.set('n', '<leader><cr>', ':noh<cr>')
-- Disable hightlight manually

-- Better yank, and works as expected like D and C do till the end of line.
vim.keymap.set('n', 'Y', 'yg_')

-- Shortcutting split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
