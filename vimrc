set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tomasr/molokai'
Plugin 'taglist.vim'
Plugin 'Tagbar'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
Plugin 'snipMate'
Plugin 'Pydiction'
Plugin 'vim-airline/vim-airline'

Plugin 'pythoncomplete'
Plugin 'pyflakes.vim'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:

filetype plugin on
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd FileType python setlocal foldmethod=indent
"
"let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1

nmap <F3> :NERDTreeToggle <CR>
nmap <F4> :Tlist<CR>
nmap <silent> <F5> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 20

map <C-l> <c-w>w
imap <C-l> <ESC> <c-w>w

"set mouse=a
set noswapfile
"set nu
set nobackup
color molokai
set hlsearch
set scrolloff=3
set tabstop=4
set ignorecase
set smartindent
set backspace=indent,eol,start
autocmd FileType python set cul cuc colorcolumn=81

"autocmd BufNewFile *.py 0r /Users/tongle/workspace/templates/python_header.template

syn on
set laststatus=2
let g:tagbar_ctags_bin='/usr/bin/ctags'
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"set tags+=/home/tongle/workspace/tags
set tags=./tags,tags;

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
autocmd BufNewFile *.py,*.cc,*.sh,*.java exec ":call SetTitle()"
func SetTitle()
        if &filetype == 'python'
                call setline(1, "\#!/usr/bin/env python")
                call setline(2, "\# -*- coding: utf8 -*-")
                "call setline(3, "")
                "call setline(4, "\# @Author: tongle")
                "call setline(5, "\# Created Time : ".strftime("%FT%T%z"))
                "call setline(6, "")
                "call setline(7, "\# File Name: ".expand("%"))
        endif
endfunc
autocmd BufNewFile * normal G
if has("gui_runing")              "如果在图形用户界面
    set background=light          "设置背景色为亮色
else                              "设置背景色为深色
	set background=dark           "就开启256色支持，默认为8色
	set t_Co=256
endif
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
highlight WhitespaceEOL ctermbg=red guibg=red 
match WhitespaceEOL /\s\+$/
