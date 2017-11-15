" Arthur Hemery (hemeryarthur@gmail.com) vim setup
" shamelessly stolen from
" https://github.com/ArthurSonzogni/neovim-configuration


"----------------------------------
" Automatically load plugins
"----------------------------------
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"----------------------------------
" Plugins
"----------------------------------
call plug#begin('~/.vim/plugged')

    " Toogle comment with <leader-c-space>
    Plug 'scrooloose/nerdcommenter'

    " Alternate header/implementation :A
    Plug 'vim-scripts/a.vim'

    " Beautiful theme
    Plug 'nightsense/vimspectr'

    " Syntax highlighting
    Plug 'sheerun/vim-polyglot'
    
    " Ctrl-p goto everywhere
    Plug 'kien/ctrlp.vim'

    Plug 'jeetsukumaran/vim-buffergator'

    " Google indent
    " :FormatLines
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'

    " Chromium specifics
    Plug 'Shouqun/chromium-vim'

call plug#end()

silent! call glaive#Install()

"----------------------------------
" Key mapping
"----------------------------------
" Don't use arrow key in normal mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Use :FormatLines instead of the default vim formatter.
autocmd FileType c vmap = :FormatLines<CR>
autocmd FileType cpp vmap = :FormatLines<CR>

"----------------------------------
" configuration
"----------------------------------

" Enable filetype plugin
if has('autocmd')
  filetype plugin indent on
endif

" Syntax highlighting
if has('syntax')
    syntax enable
endif

" Theme
silent! colorscheme vimspectr60flat-dark

" hightlight the 80th column
set colorcolumn=80

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files
set wildignore=*.o,*~

" Always show current position
set ruler

" Show a complete menu
set completeopt=longest,menuone

" don't annoy with case
set ignorecase
set smartcase

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell

" display line number
set number

" always show status line
set laststatus=2

" 1 tab == 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" define scroll margin
set scrolloff=8
set sidescroll=1
set sidescrolloff=15

" Navigate screen line instead of file line
nnoremap j gj
nnoremap k gk

" custom file listing command
let g:ctrlp_user_command = 'find %s -type f -name "*.cc" -o -name "*.h" -o -name "*.cpp"'

" show buffer window on the right instead of the left
let g:buffergator_viewport_split_policy = "R"

