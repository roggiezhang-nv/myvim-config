set nocompatible
syntax on
set number
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
autocmd FileType make setlocal noexpandtab

let mapleader=","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'rking/ag.vim'
Plugin 'Valloric/YouCompleteMe'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic' " grammer check
Plugin 'nvie/vim-flake8' " PEP8 format check
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jnurmine/Zenburn' " python color scheme
Plugin 'altercation/vim-colors-solarized' " python color scheme
Plugin 'kien/ctrlp.vim' " file search
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/LargeFile'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'tpope/vim-surround'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'scrooloose/nerdcommenter'

let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" All of your Plugins must be added before the following line
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
"
"
" configuration for ag.vim
set runtimepath^=~/.vim/bundle/ag.vim
let g:ag_working_path_mode="r"

" configuration for ctrlp.vim
map <leader>f :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|o|zip|tar|tar.gz|pyc)$',
    \ }

nnoremap <C-x> :CtrlPDir<Space>
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:ctrlp_extensions = ['funky']

let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" my key map
nnoremap <leader>s :shell<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :qa<CR>
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap td  :tabclose<CR>
nnoremap tn  :tabnew<CR>

" configuration for yourcompleter
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ge :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>go :YcmCompleter GetDoc<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_confirm_extra_conf = 0

"configuration for large file
let g:LargeFile = 10


"configuration for nerdtree
map <F8> <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" color scheme
colorscheme molokai

set backspace=start,eol,indent

" vim-javacomplete2 configuration
autocmd FileType java setlocal omnifunc=javacomplete#Complete
