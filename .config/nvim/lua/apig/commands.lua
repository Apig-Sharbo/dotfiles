-- Sudo write
vim.cmd [[ command! W :w !sudo tee % ]]
