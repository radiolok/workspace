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
Plugin 'haya14busa/incsearch.vim'
"Plugin 'SkidanovAlex/CtrlK'
"Plugin 'nathanaelkane/vim-indent-guides'

"Vim plugin that use clang for completing C/C++ code
"Plugin 'rip-rip/clang_complete'

"A tree explorer plugin
Plugin 'scrooloose/nerdtree'

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

"let g:ctrlk_clang_library_path="/usr/lib/llvm-3.6/lib"
"nmap <F3> :call GetCtrlKState()<CR>
"nmap <C-k> :call CtrlKNavigateSymbols()<CR>
"nmap <F2> :call CtrlKGoToDefinition()<CR>
"nmap <F12> :call CtrlKGetReferences()<CR>


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

"Switch Tabs using Alt+num:
:map <A-1> 1gt
:map <A-2> 2gt
:map <A-3> 3gt
:map <A-4> 4gt
:map <A-5> 5gt
:map <A-6> 6gt
:map <A-7> 7gt
:map <A-8> 8gt
:map <A-9> 9gt

"incsearch 
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"NERDTree: new tab with F2
"map :tabnew
map <F2> :tabnew <CR>
"imap :tabnew :NERDTree
map <C-F2> :NERDTree <CR>

"Stick this in your vimrc:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
