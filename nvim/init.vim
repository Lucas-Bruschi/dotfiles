execute pathogen#infect()

lua require('nvim')

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:webdevicons_enable_nerdtree = 1

":highlight Normal ctermfg=grey ctermbg=black

let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

set encoding=UTF-8

set termguicolors

highlight Pmenu ctermbg=gray guibg=gray

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

nmap <space>e <Cmd>CocCommand explorer<CR>

"inicialize number helper
set number relativenumber 
syntax on
filetype plugin indent on    " required

