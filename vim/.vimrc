" numbered stuff
set number
set relativenumber

" set some stuff up set ruler
set smartindent
set autoindent
set clipboard=unnamedplus

" set syntax highlight
syntax on

" show this shit on modeline i guess
set modelines=0


" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader>h :noh<cr> " clear search
