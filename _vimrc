" general
set encoding=utf-8
set t_Co=256
syntax on
set nocompatible               " be iMproved
filetype off                   " required!
set laststatus=2
set background=light
set number
" allow hiding modified buffers
set hidden
set rtp+=~/.vim/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
filetype plugin indent on     " required

Bundle 'Lokaltog/vim-powerline'
" powerline config
" let g:Powerline_symbols = 'fancy'
" set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h16

" indentation
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" cd folder preview
set wildmenu
set wildmode=list:longest

" no swap files
set noswapfile
set nobackup
set nowritebackup

Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'

Bundle 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<cr>
map :nt :NERDTree
map :test :w<cr> :!bundle exec rspec
imap kj <esc>
nmap <C-b> :CtrlPBuffer<cr>

function! RunSpec(args)
   let spec = "bundle exec rspec"
   let cmd = ":! " . spec . " % " . a:args
   execute cmd
endfunction

" Mappings
" run one rspec example or describe block based on cursor position
map ,T :call RunSpec("-l " . <C-r>=line('.')<CR>)<cr>
" run full rspec file
map ,t :call RunSpec("")<cr>

 " macvim config
if has("gui_running")
  set guioptions=egmrt
endif

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
set wildignore+=*/tmp/*,*.scssc,*.sassc,*.class,*.DS_Store
set wildignore+=*/vendor/bundle/*,*/server/*,*/public/system/*
set wildignore+=*theaterjobs*/vendor/*,*/web/bundles/*,*/app/cache/*,*/vendor/bundles*

" eigene einstellungen
set hlsearch
autocmd BufWritePre * :%s/\s\+$//e

" for lack of a better theme
Bundle 'Zenburn'
colorscheme zenburn

" because escape is evil
inoremap jk <esc>

" use something like this as a starting point for finding tag at point
" :nnoremap <2-LeftMouse> :exe "tag ". expand("<cword>")<CR>

" make instert mode more usable
imap <C-b> <C-O>:CtrlPBuffer<cr>
imap <C-p> <C-O>:CtrlP<cr>

" make command  mode more usable
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
"cnoremap <A-b> <S-Left>
"cnoremap <A-f> <S-Right>
