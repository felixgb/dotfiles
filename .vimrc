filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'derekwyatt/vim-scala'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

syntax on
colorscheme desert

highlight Pmenu ctermbg=gray

au BufRead,BufNewFile *.sbt set filetype=scala

set timeoutlen=1000 ttimeoutlen=0

set ts=2 sts=2 sw=2

set backupcopy=yes

set nowrap
set expandtab
set nohlsearch
set incsearch
set showmatch
set noswapfile
set autoread
set autowrite
set wildmenu

set complete+=i,w,.
set completeopt=menuone,menu
set wildmode=longest,list,full

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

set makeprg=./go
set grepprg=ag\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

let g:netrw_banner = 0
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

nnoremap <C-f> :grep 
nnoremap <C-c> :cexpr system('ag --vimgrep ' . expand("<cword>"))<CR>
function SearchAndReplace()
  let w = expand("<cword>")
  cexpr system('ag --vimgrep ' . w)
  let r = input("replace " . w . " with: ")
  execute 'cfdo s!' . w . '!' . r . '!gc | update'
endfunction

nnoremap <F8> :call SearchAndReplace()<CR>
nnoremap <F9> :SortScalaImports<CR>
nnoremap <F10> :Gstatus<CR>
nnoremap <F11> :Tags!<CR>
nnoremap <F12> :Files!<CR>

nnoremap q] :cnext<CR>
nnoremap q[ :cprev<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> ac <Plug>(coc-codeaction)

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
