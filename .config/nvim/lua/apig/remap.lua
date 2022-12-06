-- Move visually highlighted lines up and down
vim.keymap.set('v', 'K', ":move '<-2<CR>gv-gv")
vim.keymap.set('v', 'J', ":move '>+1<CR>gv-gv")

vim.keymap.set('n', '<leader><cr>', ':noh<cr>')
-- Disable hightlight manually

-- Better yank, and works as expected like D and C do till the end of line.
vim.keymap.set('n', 'Y', 'yg_')

-- Center while scrolling page up and down
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', function() return vim.api.nvim_win_get_cursor(0)[1] == 1 and '<C-d>kzz' or '<C-d>zz' end, { expr = true })  -- The purpose of this function, is for when the page line count is even. This means that you can't be truly centered, and have the same line count above and below your line, since that will always need odd number of lines. So what happens is it choses a line that when centered hides line number 1, making it out of view, and the user needs to page-up again to see line number 1. NOTE: You'll have some similar issues in the middle of the file, where you go to specific line, half-page-down then half-page-up, and if there are wrapped lines in the file, you won't go back to the correct line.

-- Center while going to previous/next search match
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Shortcutting split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
