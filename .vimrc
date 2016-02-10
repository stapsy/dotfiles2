set nocompatible              " required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required Plugin 'gmarik/Vundle.vim'

"Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

"Plugin 'vim-scripts/indentpython.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'
Plugin 'ChrisKempson/Vim-Tomorrow-Theme'
"Plugin 'Lokaltog/powerline', {'rpt': 'powerline/bindings/vim'} 
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'bling/vim-airline'
Plugin 'itchyny/lightline.vim'
"Plugin 'edkolev/tmuxline.vim' 
Plugin 'morhetz/gruvbox'

"use 'PluginInstall' to install your plugins

" All of your Plugins must be added before the following line
call vundle#end()           
" required filetype plugin indent on    " required

syntax enable
set wrap
set number
set numberwidth=3
set t_Co=256
set term=xterm-256color
set encoding=utf-8
"set t_ut=
""set go=

"set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set linebreak
set sbr=> "this is really cool...the symbol indicates line breaks!

"key mapping
"copy visual
map <C-c> "*y<CR>
set pastetoggle=<F2>

"system settings
set nobackup
set nowritebackup
set noswapfile
set hidden
set mouse=a

"colorscheme settings
"let base16colorspace=256
"let g:gruvbox_termcolors=16
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark='soft'
set background=dark
colorscheme grumple
"let g:gruvbox_contrast_dark= hard

"status bar settings
"set statusline=- "look into this setting
"set laststatus=0 noruler "look into this
set showcmd
set noshowmode
set laststatus=2
set ttimeoutlen=50

" Format the status line - needs to be tested
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"Enable lightline
let g:lightline = {
	\ 'colorscheme': '16color',
	\ 'active': {
	\	'left':  [ ['mode'], [ 'readonly', 'filename','modified'] ],
	\	'right': [ ['lineinfo',''], ['filetype'] ]
	\},
	\ 'component': {
	\	'readonly': '%{&filetype=="help"?"":&readonly?"R":""}',
	\	'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
	\},
	\ 'component_viisible_condition': {
	\	'readonly': '(&filetype!="help"&& & readonly)',
	\	'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
	\},
	\}

	
" Enable vim-airline
""let g:airline_powerline_fonts=1
"let g:airline_section_warning = '%t'
"let g:airline_section_c = '%{getcwd()}' 
"let g:airline_theme = "solarized"
"let g:airline_symbols = {}
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''

"TMUX Airline information
"let g:airline#extensions#tmuxline#enabled=0 
"let g:tmuxline_theme = 'iceberg'
"let g:tmuxline_preset = 'minimal'
"let airline#extensions#tmuxline#color_template = 'zenburn'
"let airline#extensions#tmuxline#color_template = 'insert' "let airline#extensions#tmuxline#color_template = 'visual' 
