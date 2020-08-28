set nocompatible              " be iMproved, required
filetype off                  " required

scriptencoding utf-8
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'dense-analysis/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'lifepillar/vim-solarized8'
Plugin 'ctrlpvim/ctrlp.vim'

" Clojure plugins
Plugin 'vim-scripts/paredit.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-surround'
Plugin 'venantius/vim-cljfmt'
Plugin 'tpope/vim-repeat'

" Javascript
Plugin 'isRuslan/vim-es6'

" Rust Plugins
Plugin 'rust-lang/rust.vim'

" Common Lisp
Plugin 'l04m33/vlime', {'rtp': 'vim/'}

" Go Plugins
" Plugin 'fatih/vim-go'

" Misc syntax plugins
" Plugin 'keith/swift.vim'
" Plugin 'b4winckler/vim-objc'

call vundle#end()            " required
filetype plugin indent on    " required

" General config
set backspace=indent,eol,start
syntax on
set lazyredraw
set mouse=a
set clipboard=unnamed
set colorcolumn=81
set background=dark

" tmux-friendly color settings:
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme solarized8

set number
set tabstop=8 shiftwidth=4 expandtab

" NERDTree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '^node_modules$', '^target$', '^out$', '^build$']

" ctrl-p config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
set wildignore+=*/target/*,*/out/*,*/build/*,*/.git/*,*/.hg/*,*/node_modules/*

" vim-airline
set laststatus=2 " Enables vim-airline on all buffers
function! AirlineInit()
    let g:airline_section_b = airline#section#create(['branch'])
    let g:airline_section_c = '%<%t%m'
endfunction
autocmd VimEnter * if exists(':AirlineToggle') | call AirlineInit()

" Clojure config

" cljx files
au BufNewFile,BufReadPost *.cljx set filetype=clojure
au BufNewFile,BufRead *.edn set filetype=clojure

au Filetype clojure nmap <c-c><c-k> :Require<cr>
au Filetype clojure nmap <c-c><c-e> :Eval<cr>
au Filetype clojure nmap <c-c><c-f> :%Eval<cr>
function! TestToplevel() abort
        "Eval the toplevel clojure form (a deftest) and then test-var the
        "    "result."
    normal! ^
    let line1 = searchpair('(','',')', 'bcrn', g:fireplace#skip)
    let line2 = searchpair('(','',')', 'rn', g:fireplace#skip)
    let expr = join(getline(line1, line2), "\n")
    let var = fireplace#session_eval(expr)
    let result = fireplace#echo_session_eval("(clojure.test/test-var " . var . ")")
    return result
endfunction
au Filetype clojure nmap <c-c><c-t> :call TestToplevel()<cr>
au Filetype clojure autocmd BufWritePre <buffer> :%s/\s\+$//e

" vim-cljfmt config
let g:clj_fmt_autosave = 0

" JavaScript and Json
au BufNewFile,BufReadPost .jshintrc set filetype=json
au Filetype javascript setlocal ts=2 sw=2 sts=2
au Filetype css setlocal ts=2 sw=2 sts=2
au Filetype sass setlocal ts=2 sw=2 sts=2
au Filetype scss setlocal ts=2 sw=2 sts=2

" Rust files
au Filetype rust setlocal colorcolumn=101
let g:ale_linters = { 'rust': [ 'rls' ], 'javascript': [ 'eslint' ] }
let g:ale_rust_rls_toolchain = 'stable'

" Common lisp files
au BufNewFile,BufReadPost *.asd set filetype=lisp

" Line-formatted files:
au BufRead,BufNewFile *md setlocal textwidth=80
au BufRead,BufNewFile *rst setlocal textwidth=80

set exrc
set secure
set spell spelllang=en_us
