set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
"Plugin 'valloric/youcompleteme'
"Plugin 'ternjs/tern_for_vim'
"Plugin 'cohama/lexima.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
"Plugin 'tpope/vim-eunuch'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-fugitive'

" for vim-debugger
"Plugin 'shougo/vimproc.vim'
"Plugin 'idanarye/vim-vebugger'

" language specific
"Plugin 'wlangstroth/vim-racket'
"Plugin 'pearofducks/ansible-vim'
"Plugin 'pangloss/vim-javascript'
"Plugin 'leafgarland/typescript-vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'mxw/vim-jsx'
"Plugin 'mattn/emmet-vim'
"Plugin 'briancollins/vim-jst'
"Plugin 'derekwyatt/vim-scala'
"Plugin 'eagletmt/ghcmod-vim'
"Plugin 'eagletmt/neco-ghc'
"Plugin 'lukerandall/haskellmode-vim'
"Plugin 'itchyny/vim-haskell-indent'


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

" Theme
set t_Co=256
"set background=dark
syntax enable
"colorscheme sourcerer
"highlight Normal ctermfg=black ctermbg=white

" Keybindings
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'bower_components\|node_modules\|vendor\|web/assets'
"let g:vebugger_leader='d'
" C-F5 toggles NERDTree
nmap <silent> <C-F5> :NERDTreeToggle<CR>
" C-c to close buffer and switch to previous or blank window
nnoremap <C-c> :b #\|bd #<CR>

" F5 for buffer switching
" :nnoremap <C-F5> :buffers<CR>:buffer!<Space>

"nnoremap <C-Left> :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Up> :bn!<CR>
nnoremap <C-Down> :bp!<CR>

nnoremap ; :

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
"autocmd FileType php setlocal shiftwidth=4 tabstop=4

" Show file in xterm title bar
set title

" Enable mouse
set mouse=a

" Auto reload modified files
set autoread

" Visual autocomplete for command menu
set wildmenu

" Swap files
set swapfile
set dir=~/tmp
" Disable swap files for unmodified buffers
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
  \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

" Enable airline tabs and show always
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#syntastic#enabled = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 
let g:syntastic_check_on_wq = 0
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = system('$(npm bin)/eslint_d')
"node_modules/.bin/eslint_d'
filetype on

" Tern
let g:tern_show_argument_hints = 'on_hold'
let g:tern_map_keys = 1

" neco-ghc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" ghc-mod
autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" haskellmode
let g:haddock_browser='/usr/bin/google-chrome'
