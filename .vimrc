" numbered lines
set number

" tabs have a width of 4
set softtabstop=4

" display tab characters with a width of 4
set tabstop=4

" indent lines by this width
set shiftwidth=4

" insert tabs as spaces
set expandtab

" file type detection and smart indent
filetype plugin indent on

" enable syntax highlighting
syntax on

" always show the status line as the second last line
set laststatus=2

" status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" toggle paste mode
set pastetoggle=<F10>

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Next lines is used when writing in latex

" Set line width for document writing
set textwidth=130

" Set word spelling on
"set spell"

" Language for spelling
"setlocal spell spelllang=nb"
" setlocal spell spelllang=en_us

" Latex stuff
" These settings are needed for latex-suite
filetype indent on
filetype plugin on
filetype on
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*  

" I don't like folding
let g:Tex_Folding=0
set iskeyword+=:

set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on 

" Colors for spell correction
highlight SpellBad      ctermfg=Red         term=Reverse        guisp=Red       gui=undercurl   ctermbg=White 
highlight SpellCap      ctermfg=Green       term=Reverse        guisp=Green     gui=undercurl   ctermbg=White 
highlight SpellLocal    ctermfg=Cyan        term=Underline      guisp=Cyan      gui=undercurl   ctermbg=White 
highlight SpellRare     ctermfg=Magenta     term=Underline      guisp=Magenta   gui=undercurl   ctermbg=White
