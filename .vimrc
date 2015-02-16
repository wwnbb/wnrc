"___.   ___.
"__  _  ____  _  __ ____    ____ \_ |__ \_ |__    _______   ____
"\ \/ \/ /\ \/ \/ //    \  /    \ | __ \ | __ \   \_  __ \_/ ___\
"\     /  \     /|   |  \|   |  \| \_\ \| \_\ \   |  | \/\  \___
"\/\_/    \/\_/ |___|  /|___|  /|___  /|___  / /\|__|    \___  >
"\/      \/     \/     \/  \/            \/

set nocompatible              " be iMproved, required

augroup myvimrchooks
	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'fatih/vim-go'
Plugin 'fatih/vim-nginx'
Plugin 'derekwyatt/vim-scala'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'Raimondi/delimitMate'
Plugin 't9md/vim-choosewin'
Plugin 'fatih/molokai'
Plugin 'kchmck/vim-coffee-script'
Plugin 'majutsushi/tagbar'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'bling/vim-airline'
Plugin 'cespare/vim-toml'


" colorshemes

Plugin 'klen/python-mode'

call vundle#end()            		" required
filetype on
filetype plugin on
filetype plugin indent on

"
" Settings
"
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set ruler
set history=1000

set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

set noshowmatch                 " Do not show matching brackets by flickering
set cursorline
set nocursorcolumn
set lazyredraw          	    " Wait to redraw "
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast
set nowrap

" folding based on language
set foldmethod=syntax

" speed up syntax highlighting
syntax sync minlines=256
set synmaxcol=128
set re=1


set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" colorscheme
syntax enable
set background=dark
set t_Co=256
set colorcolumn=+1
set textwidth=80
colorscheme jellybeans


" Tab bar colors

" Scrolling options
set scrolljump=5
set scrolloff=3


" Folding
set foldcolumn=1
set foldlevelstart=10


" F*ck backups and swap files
set nobackup
set noswapfile
set nowritebackup

" Scrolling options
set scrolljump=5
set scrolloff=3

" Easy indents
vnoremap < <gv
vnoremap > >gv
nmap < <<
nmap > >>


" Paste
set pastetoggle=<F2>

" Stop completion with enter, in addition to default ctrl+y
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"


" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"Dont show me any output when I build something
"Because I am using quickfix for errors
nmap <leader>m :make<CR><enter>

" Some useful quickfix shortcuts
":cc      see the current error
":cn      next error
":cp      previous error
":clist   list all errors
map <C-n> :cn<CR>
map <C-m> :cp<CR>

" Close quickfix easily
nnoremap <leader>a :cclose<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fast saving
nmap <leader>w :w!<cr>


" Select search pattern howewever do not jump to the next one
nnoremap <leader>f *N



" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"nnoremap <leader>. :lcd %:p:h<CR>
autocmd BufEnter * silent! lcd %:p:h

" trim all whitespaces away
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Reindent whoel file
map <F7> mzgg=G`z<CR>

nmap <leader>l :tabn<CR>
nmap <leader>h :tabp<CR>
map <leader>a :tabnew ~/.vimrc<CR>
map <leader>t :tabnew<CR>
nnoremap <tab> <c-w>w
nnoremap <Space> zA
vnoremap <Space> zA

" ========== Mozzila autoreload ==========="
autocmd BufWriteCmd *.html,*.css,*.gtpl :call Refresh_firefox()
function! Refresh_firefox()
	if &modified
		write
		silent !echo  'vimYo = content.window.pageYOffset;
					\ vimXo = content.window.pageXOffset;
					\ BrowserReload();
					\ content.window.scrollTo(vimXo,vimYo);
					\ repl.quit();'  |
					\ nc -w 1 localhost 4242 2>&1 > /dev/null
	endif
endfunction

" ========== Steve Losh hacks ==========="

" Don't move on *
" I'd use a function for this but Vim clobbers the last search when you're in
" a function so fuck it, practicality beats purity.
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" iTerm2 is currently slow as balls at rendering the nice unicode lines, so for
" now I'll just use ASCII pipes.  They're ugly but at least I won't want to kill
" myself when trying to move around a file.
set fillchars=stl:-,stlnc:-
set fillchars=vert:\│

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Resize splits when the window is resized
au VimResized * :wincmd =

" }}}
" Visual Mode */# from Scrooloose {{{

function! s:VSetSearch()
	let temp = @@
	norm! gvy
	let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
	let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}
" Next and Last {{{
"
" Motion for "next/last object".  "Last" here means "previous", not "final".
" Unfortunately the "p" motion was already taken for paragraphs.
"
" Next acts on the next object of the given type, last acts on the previous
" object of the given type.  These don't necessarily have to be in the current
" line.
"
" Currently works for (, [, {, and their shortcuts b, r, B.
"
" Next kind of works for ' and " as long as there are no escaped versions of
" them in the string (TODO: fix that).  Last is currently broken for quotes
" (TODO: fix that).
"
" Some examples (C marks cursor positions, V means visually selected):
"
" din'  -> delete in next single quotes                foo = bar('spam')
"                                                      C
"                                                      foo = bar('')
"                                                                C
"
" canb  -> change around next parens                   foo = bar('spam')
"                                                      C
"                                                      foo = bar
"                                                               C
"
" vin"  -> select inside next double quotes            print "hello ", name
"                                                       C
"                                                      print "hello ", name
"                                                             VVVVVV

onoremap an :<c-u>call <SID>NextTextObject('a', '/')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', '/')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', '/')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', '/')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', '?')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', '?')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', '?')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', '?')<cr>


function! s:NextTextObject(motion, dir)
	let c = nr2char(getchar())
	let d = ''

	if c ==# "b" || c ==# "(" || c ==# ")"
		let c = "("
	elseif c ==# "B" || c ==# "{" || c ==# "}"
		let c = "{"
	elseif c ==# "r" || c ==# "[" || c ==# "]"
		let c = "["
	elseif c ==# "'"
		let c = "'"
	elseif c ==# '"'
		let c = '"'
	else
		return
	endif

	" Find the next opening-whatever.
	execute "normal! " . a:dir . c . "\<cr>"

	if a:motion ==# 'a'
		" If we're doing an 'around' method, we just need to select around it
		" and we can bail out to Vim.
		execute "normal! va" . c
	else
		" Otherwise we're looking at an 'inside' motion.  Unfortunately these
		" get tricky when you're dealing with an empty set of delimiters because
		" Vim does the wrong thing when you say vi(.

		let open = ''
		let close = ''

		if c ==# "("
			let open = "("
			let close = ")"
		elseif c ==# "{"
			let open = "{"
			let close = "}"
		elseif c ==# "["
			let open = "\\["
			let close = "\\]"
		elseif c ==# "'"
			let open = "'"
			let close = "'"
		elseif c ==# '"'
			let open = '"'
			let close = '"'
		endif

		" We'll start at the current delimiter.
		let start_pos = getpos('.')
		let start_l = start_pos[1]
		let start_c = start_pos[2]

		" Then we'll find it's matching end delimiter.
		if c ==# "'" || c ==# '"'
			" searchpairpos() doesn't work for quotes, because fuck me.
			let end_pos = searchpos(open)
		else
			let end_pos = searchpairpos(open, '', close)
		endif

		let end_l = end_pos[0]
		let end_c = end_pos[1]

		call setpos('.', start_pos)

		if start_l == end_l && start_c == (end_c - 1)
			" We're in an empty set of delimiters.  We'll append an "x"
			" character and select that so most Vim commands will do something
			" sane.  v is gonna be weird, and so is y.  Oh well.
			execute "normal! ax\<esc>\<left>"
			execute "normal! vi" . c
		elseif start_l == end_l && start_c == (end_c - 2)
			" We're on a set of delimiters that contain a single, non-newline
			" character.  We can just select that and we're done.
			execute "normal! vi" . c
		else
			" Otherwise these delimiters contain something.  But we're still not
			" sure Vim's gonna work, because if they contain nothing but
			" newlines Vim still does the wrong thing.  So we'll manually select
			" the guts ourselves.
			let whichwrap = &whichwrap
			set whichwrap+=h,l

			execute "normal! va" . c . "hol"

			let &whichwrap = whichwrap
		endif
	endif
endfunction

" ----------------------------------------- "
" File Type settings 			    		"
" ----------------------------------------- "

au BufNewFile,BufRead *.vim setlocal noet ts=2 sw=2 sts=2
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal noet ts=4 sw=4

augroup filetypedetect
	au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
	au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
augroup END

au FileType nginx setlocal noet ts=4 sw=4 sts=4

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" coffeescript settings
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" js settings
autocmd BufNewFile,BufReadPost *.js,*.json,*.html,*.css,*.scss setl shiftwidth=2 expandtab

" scala settings
autocmd BufNewFile,BufReadPost *.scala setl shiftwidth=2 expandtab

" lua settings
autocmd BufNewFile,BufRead *.lua setlocal noet ts=4 sw=4 sts=4


" Wildmenu completion {{{
set wildmenu
" set wildmode=list:longest
set wildmode=list:full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                       " Go static files
set wildignore+=go/bin                       " Go bin files
set wildignore+=go/bin-vagrant               " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" Prettify json
com! JSONFormat %!python -m json.tool


" ----------------------------------------- "
" Plugin configs 			    			"
" ----------------------------------------- "

" ==================== CtrlP ====================
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_match_func  = {'match' : 'matcher#cmatch'}
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10		" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'	" jump to a file if it's open already
let g:ctrlp_mruf_max=450 		" number of recently opened files
let g:ctrlp_max_files=0  		" do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

func! MyPrtMappings()
	let g:ctrlp_prompt_mappings = {
				\ 'AcceptSelection("e")': ['<c-t>'],
				\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
				\ }
endfunc

func! MyCtrlPTag()
	let g:ctrlp_prompt_mappings = {
				\ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
				\ 'AcceptSelection("t")': ['<c-t>'],
				\ }
	CtrlPBufTag
endfunc

let g:ctrlp_buffer_func = { 'exit': 'MyPrtMappings' }
com! MyCtrlPTag call MyCtrlPTag()

let g:ctrlp_buftag_types = {
			\ 'go'     	   : '--language-force=go --golang-types=ftv',
			\ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
			\ 'markdown'   : '--language-force=markdown --markdown-types=hik',
			\ 'objc'       : '--language-force=objc --objc-types=mpci',
			\ 'rc'         : '--language-force=rust --rust-types=fTm'
			\ }



" ==================== YouCompleteMe ====================
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1


" ==================== ChooseWin ====================
nmap  -  <Plug>(choosewin)

" ==================== Pymode ====================
let g:pymode_rope_lookup_project = 1
let g:pymode_rope_complete_on_dot = 0

" ==================== DelimitMate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1


" ==================== Fugitive ====================
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
vnoremap <leader>gb :Gblame<CR>


" ==================== Airline ====================
let g:airline_left_sep  = ' '
let g:airline_right_sep = ' '


" ==================== CommandT ====================
let g:CommandTMaxHeight = 20
let g:CommandTMaxFiles = 500000
let g:CommandTMatchWindowReverse = 1
let g:CommandTMaxCachedDirectories = 0
let g:CommandTAcceptSelectionTabMap = '<CR>'
let g:CommandTHighlightColor = 'Typedef'

" ==================== Vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt"


au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>t <Plug>(go-def-tab)

au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap  <leader>r  <Plug>(go-run)
au FileType go nmap  <leader>b  <Plug>(go-build)

au FileType go nmap <Leader>d <Plug>(go-doc)

" ==================== UltiSnips ====================
function! g:UltiSnips_Complete()
	call UltiSnips#ExpandSnippetOrJump()
	if g:ulti_expand_or_jump_res == 0
		if pumvisible()
			return "\<C-N>"
		else
			return "\<TAB>"
		endif
	endif

	return ""
endfunction

function! g:UltiSnips_Reverse()
	call UltiSnips#JumpBackwards()
	if g:ulti_jump_backwards_res == 0
		return "\<C-P>"
	endif

	return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
	let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
	let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

" ==================== NerdTree ====================
" Open nerdtree in current dir, write our own custom function because
" NerdTreeToggle just sucks and doesn't work for buffers
let NERDTreeShowBookmarks=1
map <leader>n :NERDTreeToggle<CR>

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
