"source $VIMRUNTIME/mswin.vim
:color darkblue
:syntax on

:set belloff=all
:set incsearch
:set hlsearch

:set backspace=2

:set tabstop=4
:set shiftwidth=4
:set smarttab
:set expandtab
:set autoindent
:set smartindent

if has("gui_running")
  :set guifont=Fira\ Code:h11
endif

let g:explVertical=1
let g:explWinSize=25

:nmap <F2> :w<CR>
:imap <F2> <ESC>:w<CR>a

:nmap <C-S> :w<CR>
:imap <C-S> <ESC>:w<CR>a

:nmap <F9> :A<CR>
:imap <F9> <ESC>:A<CR>

:nmap <C-F4> :close<CR>
:imap <C-F4> <ESC>:close<CR>
