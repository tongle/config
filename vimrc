"~/.vimrc (configuration file for vim only)

"vundle begin
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tomasr/molokai'
Bundle 'taglist.vim'
Bundle 'Tagbar'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'snipMate'
Bundle 'Pydiction'
Bundle 'vim-airline/vim-airline'

Bundle 'pythoncomplete'
Bundle 'pyflakes.vim'
"Bundle 'Pydiction'

filetype plugin indent on     " required!
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
set nu
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

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
syn on
set laststatus=2
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
autocmd BufNewFile *.py,*.cc,*.sh,*.java exec ":call SetTitle()"                                                                                                
"新建.py,.cc,.java,.sh,  
""定义函数SetTitle，自动插入文件头  
func SetTitle()  
        "如果文件类型为.sh文件  
        if &filetype == 'python'  
                call setline(1, "\#!/usr/bin/env python")  
                call setline(2, "\# -*- coding: utf8 -*-")  
                call setline(3, "")  
                call setline(4, "\# @Author: tongle")  
                call setline(5, "\# Created Time : ".strftime("%FT%T%z"))  
                call setline(6, "")  
                call setline(7, "\# File Name: ".expand("%"))  
        endif  
endfunc
autocmd BufNewFile * normal G
