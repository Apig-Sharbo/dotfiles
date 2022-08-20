vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.breakindent = true

vim.cmd[[
  " Disable stupid backup and swap files - they trigger too many events
  " for file system watchers
      set nobackup
      set nowritebackup
      set noswapfile
]]
