filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'vim-test/vim-test'
call plug#end()

syntax on
colorscheme industry

highlight Pmenu ctermbg=gray
highlight SignColumn ctermbg=darkred

au BufRead,BufNewFile *.sbt set filetype=scala

set timeoutlen=1000 ttimeoutlen=0

set ts=2 sts=2 sw=2

set backupcopy=yes

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

set diffopt+=vertical

nnoremap <SPACE> <Nop>
let mapleader = " "

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

let g:scala_sort_across_groups = 1
let g:scala_first_party_namespaces = '\(uk.gov.hmrc.aeo\)'

let g:coc_disable_startup_warning = 1

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Show all diagnostics
nnoremap <silent> <leader>a :CocFzfList diagnostics<CR>
nnoremap <silent> <leader>c :CocFzfList commands<CR>
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>s :TestFile<CR>
nnoremap <silent> <leader>g :Gstatus<CR>
nnoremap <silent> <C-p> :Files!<CR>

" You will have a bad experience with diagnostic messages with the default
" 4000.
set updatetime=300
"
" " Don't give |ins-completion-menu| messages.
set shortmess+=c

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let test#scala#runner = 'blooptest'
let test#strategy = 'neovim'
let g:test#scala#blooptest#project_name = fnamemodify(getcwd(), ':t')

