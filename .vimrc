                                "___.   ___.
"__  _  ____  _  __ ____    ____ \_ |__ \_ |__    _______   ____
"\ \/ \/ /\ \/ \/ //    \  /    \ | __ \ | __ \   \_  __ \_/ ___\
 "\     /  \     /|   |  \|   |  \| \_\ \| \_\ \   |  | \/\  \___
  "\/\_/    \/\_/ |___|  /|___|  /|___  /|___  / /\|__|    \___  >
                      "\/      \/     \/     \/  \/            \/

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
set nocompatible              " be iMproved

filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundle list was hire

    Bundle 'tpope/vim-surround'
    Bundle 'gmarik/vundle'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'bling/vim-airline'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'tomasr/molokai'
    Bundle 'mattn/emmet-vim'
    Bundle 'ervandew/supertab'
    Bundle 'Lokaltog/vim-distinguished'
    Bundle 'nanotech/jellybeans.vim'
    Bundle 'scrooloose/nerdtree'
    Bundle 'klen/python-mode'
    Bundle "MarcWeber/vim-addon-mw-utils"
    Bundle "tomtom/tlib_vim"
    Bundle "garbas/vim-snipmate"
    Bundle "honza/vim-snippets"
    Bundle 'tpope/vim-fugitive' 
    Bundle 'vim-scripts/loremipsum'
    Bundle 'nathanaelkane/vim-indent-guides',


" Some basic options

    filetype plugin indent on

    set omnifunc=syntaxcomplete#Complete

    au VimResized * :wincmd =

    set mouse=a
    set mousehide

    set number
    set nocompatible

    set shiftwidth=4
    set tabstop=4
    set autoindent
    set smartindent
    set expandtab
    set backspace=indent,eol,start
    au BufNewFile,BufRead,BufEnter *.html set shiftwidth=2
    set formatoptions-=ro


    set ruler
    set encoding=utf-8
    set history=1000

    set fillchars=diff:⣿,vert:│

    set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:•
    set showbreak=↪

    set textwidth=80
    au FileType python setlocal colorcolumn=+1


    set t_Co=256
    syntax enable
    set background=dark
    color jellybeans
    hi TabLineSel ctermfg=Black ctermbg=DarkGreen


    set wildmenu
    set wildmode=list:longest


    set hidden

    set virtualedit=onemore

    set cursorline
    set showmatch

    set scrolljump=5
    set scrolloff=3

    set list
    set listchars=

    set splitright
    set splitbelow

    vnoremap < <gv
    vnoremap > >gv

    set novisualbell


" Folding

    set foldcolumn=1
    set foldlevelstart=10

" F*ck backups and swap files

    set nobackup
    set noswapfile
    set nowritebackup

" Map leader and quit

    let mapleader = ','
    map <leader>q :q<CR>
    map <leader>qq :qa!<CR>
    map <leader>qw :wq<CR>
    map <leader>w :w<CR>

" Easy indents

    nmap < <<
    nmap > >>

" Tabs navigation

    nmap <leader>l :tabn<CR>
    nmap <leader>h :tabp<CR>
    map <leader>a :tabnew ~/.vimrc<CR>
    map <leader>t :tabnew<CR>
    map <leader>nt :NERDTreeToggle<CR>
    nnoremap <tab> <c-w>w
    nnoremap <Space> za
    vnoremap <Space> za

" Paste

    set pastetoggle=<F2>

" Window navigation

    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

" Supertab

    let g:SuperTabDefaultCompletionType = "<c-n>"
    let g:SuperTabLongestHighlight = 1
    let g:SuperTabCrMapping = 1
    nmap <S-Enter> O<Esc>
    nmap <CR> o<Esc>

" Airline
    set laststatus=2
    set noshowmode


" YouCompleteMe
    autocmd FileType python set omnifunc=pythoncomplete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
    let g:ycm_min_num_of_chars_for_completion = 4
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_seed_identifiers_with_syntax = 1

    let g:pymode_rope_complete_on_dot = 0

" Emmet vim
    imap § <C-y>,
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,htmldjango EmmetInstall
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''

" NEERD tree

    let NERDTreeShowBookmarks=1

" Snipmate

    imap <C-l> <Plug>snipMateNextOrTrigger

" Indintation guides
    
    hi IndentGuidesOdd  ctermbg=grey
    hi IndentGuidesEven ctermbg=lightGrey
    let g:indent_guides_guide_size=2
