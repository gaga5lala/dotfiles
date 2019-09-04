set nocompatible              " be iMproved, required
filetype off                  " required

"// --- vim-plugin --- //

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/solarized'

" rails related plugin
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'

Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-endwise'

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-powerline'

Plugin 'scrooloose/nerdtree'

Plugin 'mileszs/ack.vim'

Plugin 'ConradIrwin/vim-bracketed-paste'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"// --- general setting ---//
syntax enable

set enc=utf8

set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
" :set cursorline " 顯示游標所在位置
set cursorcolumn " 顯示游標所在位置
set hlsearch                          " search highlighting
set incsearch                         " incremental search
set ignorecase " 搜尋時忽略大小寫
set number relativenumber

" http://cenalulu.github.io/linux/why-my-backspace-not-work-in-vim/
set backspace=2
" system clipboard
set clipboard=unnamed

"set background=dark
colorscheme Tomorrow-Night
"colorscheme solarized
set t_Co=256

filetype plugin indent on

" Clear highlighting by hitting return in normal mode
nnoremap <CR> :noh<CR><CR>

" remap keys
inoremap jk <ESC>

"""""""
" RSpec.vim mappings
"""""""
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" --- NERDTree plugin ---
nnoremap <silent> <F5> :NERDTree<CR>
map <leader>r :NERDTreeFind<cr>
nmap <silent> <C-N> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
" let NERDTreeIgnore = ['cscope\.*', '\.*temp\.*']

" --- fugitive plugin ---
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gl :Glog<CR>
"nnoremap <silent> <leader>gp :Git push<CR>


" --- Ctrlp plugin ---
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/bin/*,*/target/*,*.so,*.swp,*.zip,*/Godeps/*,*/vendor/*     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows  "
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|Godeps\|vendor\|tmp$',
        \ 'file': '\v\.(exe|so|dll|class|a)$',
        \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
        \ }

let g:ctrlp_max_files = 1000000 " 加大 cache 索引的檔案數, 否則會漏找檔案

" Make CtrlP faster
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

" --- Ctags ---
let g:rails_ctags_arguments = ['--languages=ruby --exclude=.git --exclude=log .']

" puts the caller
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>


" mark traling space as error message
match ErrorMsg '\s\+$'

runtime macros/matchit.vim
