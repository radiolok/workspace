set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'
"Plugin 'SkidanovAlex/CtrlK'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
"All of your Plugins must be added before the following line

"Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:ctrlk_clang_library_path="libclang_so_path"
nmap <F3> :call GetCtrlKState()<CR>
nmap <C-k> :call CtrlKNavigateSymbols()<CR>
nmap <F2> :call CtrlKGoToDefinition()<CR>
nmap <F12> :call CtrlKGetReferences()<CR>
	 
"Set highlight for search
:set hlsearch
"case non-sensitive search by default:
:set ignorecase 
:set smartcase

"Set incremental search
:set incsearch

:colorscheme  desert
"Set C-standard auto-indent
:set cindent

:set ts=2 sw=2 et
let g:indent_guides_start_level=2

" Better command-line completion

:set wildmode=longest,list,full
:set wildmenu

" Settings for Syntax checking hacks for vim
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

