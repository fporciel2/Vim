" 42 Stdheader settings

let g:user42 = 'fporciel'
let g:mail42 = 'fporciel@student.42roma.it'

" Tabulation settings

set tabstop=4
set noexpandtab
set shiftwidth=4

" Indentation settings
set colorcolumn=80
set textwidth=80
set autoindent
set smartindent
filetype on
filetype plugin on
filetype plugin indent on
set backspace=indent,eol,start

" Syntax highliting settings and user interface

autocmd FileType c inoremap <silent> <C-Space> <C-X><C-O>
set nocompatible
syntax on
set number
colorscheme murphy
set laststatus=2
set statusline=%F%m%r%h%w\ %l,%v[%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set ruler
set mouse=a
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_preview = 1
autocmd VimEnter * :Lexplore
