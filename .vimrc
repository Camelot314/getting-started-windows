" Install vim-plug if not found
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

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


" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

set nowrap
set number
set cc=81

" indentation
set ts=4 sts=2 sw=2
set expandtab

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

