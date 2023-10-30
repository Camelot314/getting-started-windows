source $VIMRUNTIME/defaults.vim
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGIN MANAGER
call plug#begin('~/vimfiles/plugged')
" - Automatically executes `filetype plugin indent on` and `syntax enable`.

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" Color Scheme
Plug 'https://github.com/bluz71/vim-nightfly-colors.git', { 'as': 'nightfly' } 

" Light line status bar
Plug 'itchyny/lightline.vim' 

" Git branch names
Plug 'itchyny/vim-gitbranch'

" Rainbow Parens
Plug 'luochen1990/rainbow'

" commenting
Plug 'tpope/vim-commentary'

call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting


set number
set cc=81
set sts=4 ts=4 expandtab

" undo and redo
noremap r <C-r>

" copy and pasting
noremap y "+y
noremap p "+p
noremap x "+x


" Window options
set splitright
set splitbelow

set vb t_vb=

" status line
set laststatus=2
let g:lightline = {
	\ 'colorscheme': 'nightfly',
	\ 'active': {
	\	'left':  [ ['mode', 'paste'],
	\				['filename', 'gitbranch', 'readonly','modified'] ],
	\	'right': [	['lineinfo'],
	\				['percent'],
	\				['fileformat','filetype']]
	\ },
	\
	\ 'component_function': {
	\	'gitbranch': 'gitbranch#name'
	\ },
	\ }

set wildmenu


colorscheme nightfly
" sets vim to use the true colors
set termguicolors
" setting the cursor color
let g:nightflyCursorColor = v:true

filetype plugin indent on

" Rainbo Parenthesis settings
let g:rainbow_active = 1 
"set to 0 if you want to enable it later via :RainbowToggle

