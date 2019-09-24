filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'derekwyatt/vim-scala'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

" let g:coc_global_extensions = ['coc-tsserver']

syntax on

let g:jellybeans_overrides = {
      \    'background': { '256ctermbg': 'none' },
      \}

colorscheme jellybeans

au BufRead,BufNewFile *.sbt set filetype=scala

set timeoutlen=1000 ttimeoutlen=0

set ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4

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

set tags=./tags;/,dep_tags

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

set makeprg=./go
set grepprg=ag\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

let g:netrw_banner = 0
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

nnoremap <C-f> :grep 
nnoremap <C-p> :FZF<CR>
nnoremap <C-c> :cexpr system('ag --vimgrep ' . expand("<cword>"))<CR>

nnoremap q] :cnext<CR>
nnoremap q[ :cprev<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> ac <Plug>(coc-codeaction)

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
