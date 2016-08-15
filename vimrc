set nocompatible              " be iMproved, required
filetype off                  " required

set clipboard=unnamed

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'

" Clojure plugins
Plugin 'vim-scripts/paredit.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-surround'
Plugin 'venantius/vim-cljfmt'
Plugin 'tpope/vim-repeat'

" Misc syntax plugins
Plugin 'keith/swift.vim'
Plugin 'b4winckler/vim-objc'

call vundle#end()            " required
filetype plugin indent on    " required

" General config
set backspace=indent,eol,start
syntax on
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set number
set tabstop=8 shiftwidth=4 expandtab

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['pep8']

" NERDTree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '^node_modules$', '^target$', '^out$']

" ctrl-p config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
set wildignore+=*/target/*,*/out/*,*/.git/*,*/.hg/*,*/node_modules/*

" vim-airline
set laststatus=2 " Enables vim-airline on all buffers
function! AirlineInit()
    let g:airline_section_b = airline#section#create(['branch'])
    let g:airline_section_c = '%<%t%m'
    let g:airline_section_warning = airline#section#create(['syntastic'])
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
