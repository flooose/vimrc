" general
set encoding=utf-8
set t_Co=256
set nocompatible               " be iMproved
set laststatus=2
set background=light
set number

" change leader
let mapleader=","

" allow hiding modified buffers
set hidden
set rtp+=~/.vim/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

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
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'duff/vim-scratch'
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

noremap <silent> <Leader>h :wincmd h<CR>
noremap <silent> <Leader>j :wincmd j<CR>
noremap <silent> <Leader>k :wincmd k<CR>
noremap <silent> <Leader>l :wincmd l<CR>
noremap <silent> <Leader>q :close<CR>

 " macvim config
if has("gui_running")
  set guioptions=egmrt
endif

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
set wildignore+=*/tmp/*,*.scssc,*.sassc,*.class,*.DS_Store
set wildignore+=*/vendor/bundle/*,*/server/*,*/public/system/*

" eigene einstellungen
set hlsearch
autocmd BufWritePre * :%s/\s\+$//e

" for lack of a better theme
Bundle 'Zenburn'
colorscheme zenburn

" because escape is evil
inoremap kj <esc>

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
"
syntax on
filetype on
filetype indent on
filetype plugin on

let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_clear_cache_on_exit = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|vendor/bundle|public/javascripts/compiled|node_modules|venv$'
