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

" 42-GPL Script

function! InsertGPL()
    let l:formattedGPLNotice = []
    let l:gplNotice = [
    \ '<one line to give the program''s name and a brief idea',
	\ 'of what it does.>',
    \ 'Copyright (C) <year>  <name of author>',
    \ '',
    \ 'This program is free software: you can redistribute it and/or modify',
    \ 'it under the terms of the GNU General Public License as published by',
    \ 'the Free Software Foundation, either version 3 of the License, or',
    \ '(at your option) any later version.',
    \ '',
    \ 'This program is distributed in the hope that it will be useful,',
    \ 'but WITHOUT ANY WARRANTY; without even the implied warranty of',
    \ 'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the',
    \ 'GNU General Public License for more details.',
    \ '',
    \ 'You should have received a copy of the GNU General Public License',
    \ 'along with this program.  If not, see <https://www.gnu.org/licenses/>.',
    \ '',
    \ 'For more information on how to contact me by electronic and paper mail',
	\ 'please see:',
    \ '<your contact information here>'
    \ ]
    if &filetype == 'make'
        for line in l:gplNotice
            call add(l:formattedGPLNotice, '#' . line)
        endfor
    elseif &filetype == 'c'
		call add(l:formattedGPLNotice, '/* ' . l:gplNotice[0])
        for i in range(1, len(l:gplNotice) - 1)
            call add(l:formattedGPLNotice, ' * ' . l:gplNotice[i])
        endfor
		call add(l:formattedGPLNotice, ' */')
    else
        echo "This command only applies to C files and Makefiles."
        return
    endif
    call append(11, l:formattedGPLNotice)
endfunction

command! GPL call InsertGPL()

nnoremap <F1> :Stdheader<CR>:GPL<CR>

autocmd VimEnter * nnoremap <F1> :Stdheader<CR>:GPL<CR>
autocmd VimEnter * :Lexplore
