" My list of plugins
call plug#begin('~/.local/share/nvim/plugged')

    Plug 'dag/vim-fish'
    " Plug 'ying17zi/vim-live-latex-preview'
	" Plug 'ludovicchabant/vim-gutentags'	" manage Ctags
    " Plug 'ptzz/lf.vim'
    Plug 'rbgrouleff/bclose.vim'
	Plug 'preservim/nerdtree'		" Tree view Folders and Files
	Plug 'ryanoasis/vim-devicons'
	" Plug 'Xuyuanp/nerdtree-git-plugin'	" NerdTree git integration
	Plug 'SirVer/ultisnips'			" Ultimate solution for snippets
	Plug 'Shougo/deoplete.nvim' 		" Autocomplete
	Plug 'deoplete-plugins/deoplete-jedi'
	Plug 'jiangmiao/auto-pairs'		" Autopair brackets, quotes, etc...
	Plug 'tpope/vim-commentary'		" Simple code Commenter
	Plug 'preservim/nerdcommenter'		" Advanced code Commenter
	Plug 'tpope/vim-fugitive'		" Ultimate Git setup
        " Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-surround'		" Surround with ([{'`\", etc...
	" Plug 'vim-syntastic/syntastic' 	" Syntax check
	" Plug 'nvie/vim-flake8'		" PEP 8 check
	Plug 'dense-analysis/ale'		" Linters and Fixers
	Plug 'unblevable/quick-scope'		" Vim motion highlighting
	" Plug 'ap/vim-css-color'		" CSS colors
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }	" CSS colors
    " Plug 'morhetz/gruvbox'
    Plug 'gruvbox-community/gruvbox'
    " Plug 'jremmen/vim-ripgrep'
    Plug 'junegunn/fzf.vim'
    Plug 'hashicorp/terraform'
    Plug 'wata727/tflint'
    Plug 'juliosueiras/terraform-lsp'
    Plug 'hashivim/vim-terraform'
    Plug 'tmux-plugins/vim-tmux-focus-events'

" Initialize plugin system
call plug#end()

colorscheme gruvbox

" let mapleader = " "

" Use system clipboard
" set clipboard+=unnamedplus

" LaTex
syntax on
filetype plugin indent on

" Set up :make to use fish for syntax checking.
compiler fish

" Unmap Q: Ex-mode
noremap Q <Nop>

nnoremap <silent> <A-k> <Plug>(ale_previous_wrap)
nnoremap <silent> <A-j> <Plug>(ale_next_wrap)

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Toggle NerdTree
noremap <C-n> :NERDTreeToggle<CR>

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" fzf
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <leader>o :Buffers<CR>
nnoremap <C-f> :RG<Space>

" Shortcutting split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap <silent> <leader>= <C-w>=
nnoremap <silent> <leader>> :vertical resize +5<CR>
nnoremap <silent> <leader>< :vertical resize -5<CR>
nnoremap <silent> <leader>- :resize -5<CR>
nnoremap <silent> <leader>+ :resize +5<CR>

nnoremap <leader>g :ALEGoToDefinition<CR>
" These 👇 are deprecated and make 👆 slow.
" nnoremap <leader>gt :ALEGoToDefinitionInTab<CR>
" nnoremap <leader>gs :ALEGoToDefinitionInSplit<CR>

" Uncomment to send output to null
command! W :w !sudo tee %

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Hexokinase
let g:Hexokinase_highlighters = [ 'backgroundfull' ]

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:deoplete#enable_at_startup = 1

let g:terraform_align=1
let g:terraform_fmt_on_save=1

" set omnifunc=ale#completion#OmniFunc
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\  	'python': ['black'],
\   'terraform': ['terraform'],
\   'javascript' : ['eslint']
\}

let g:ale_linters = {
\	'python': ['flake8'],
\   'latex':['texlab'],
\   'terraform': ['tflint'],
\}

call deoplete#custom#source('ale', 'rank', 999)

" call deoplete#custom#option('sources', {
" \ '_': ['ale'],
" \})

" call deoplete#custom#option('sources',
"       \{ '_': ['ale'],
"       \'rust': ['ale'],
"       \'cpp': ['ale'],
"       \'sh': ['ale'],
"       \})

" Rg command with preview window
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

" Hide statusline with fzf
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Close Netrw if it's the only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Compile st
autocmd BufWritePost ~/suckless-mine/st/config.h !sudo make -C ~/suckless-mine/st clean install

" Compile dmenu
autocmd BufWritePost ~/dmenu/config.h !sudo make -C ~/suckless-mine/dmenu clean install

" Compile dwm
autocmd BufWritePost ~/suckless-mine/dwm/config.h !sudo make -C ~/suckless-mine/dwm clean install

" Compile slstatus
autocmd BufWritePost ~/suckless-mine/slstatus/config.h !sudo make -C ~/suckless-mine/slstatus clean install

" Compile dwmblocks
autocmd BufWritePost ~/dwmblocks/blocks.h !sudo make -C ~/dwmblocks clean install

" Compile slock
autocmd BufWritePost ~/suckless-mine/slock/config.h !sudo make -C ~/suckless-mine/slock clean install

" Compile LateX in the current directory of the terminal
autocmd BufWritePost *.tex !pdflatex %

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %


autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType Vagrantfile setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType Dockerfile setlocal ts=2 sts=2 sw=2 expandtab

" autocmd FocusGained,BufEnter * :silent! !
" au FocusGained,BufEnter * :checktime
" set autoread

" trigger `autoread` when files changes on disk
  set autoread
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
  autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" Replace Tabs with Spaces
    set expandtab
" Make Tabs be 4 Spaces
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4

" Keep indentation for very long strings that wrap around to new line
set breakindent

" Deoplete close recomandation window after selection
    set completeopt-=preview

" Some basics:
    set number relativenumber

" Splits open at the bottom and right
    set splitbelow splitright

    set cursorline
    " set scrolloff=999

" Set terminal colors
	set termguicolors

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" sample settings
" hi Pmenu ctermfg=254 ctermbg=237 cterm=NONE guifg=#e1e1e1 guibg=#383838 gui=NONE
" hi PmenuSel ctermfg=135 ctermbg=239 cterm=NONE guifg=#3ff8f8 guibg=#4e4e4e gui=NONE
" hi NonText guifg=#3ff8f8

highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
