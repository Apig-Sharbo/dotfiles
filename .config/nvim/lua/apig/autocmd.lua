vim.cmd [[
  " Compile LateX. Directory name is taken by reading this documentation: http://vimdoc.sourceforge.net/htmldoc/cmdline.html#filename-modifiers
  autocmd BufWritePost *.tex !cd "%:p:h" && pdflatex %

  " Run xrdb whenever Xdefaults or Xresources are updated.
  autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

  " Make sure text is unfolded for .keep files
  autocmd BufEnter *.keep normal zR

  " trigger `autoread` when files changes on disk
  set autoread
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

  " notification after file change
  autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]]
