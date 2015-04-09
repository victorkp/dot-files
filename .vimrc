syntax on
set ruler
set number

set vb

set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/

" use old regex engine for syntax highlighting
set re=1

filetype plugin indent on
set cursorline

set wildmenu
set wildmode=list:longest,full
set showcmd
set hlsearch

set ignorecase
set smartcase

set runtimepath+=$HOME/.vim/plugin/

set lazyredraw

set scrolloff=4

execute pathogen#infect()

" NERDTree shortcut
map <C-t> :NERDTreeTabsToggle<CR>
let g:NERDTreeWinSize = 39
let g:NERDTreeWinPos = "right"

command CDHere cd %:p:h

function s:openFolder()
	:CDHere
	:botright vsplit
	:vertical resize 40
	:Explore
endfunction

command Folder :call <SID>openFolder()

" Some common typos I make all the time
command Tabp :tabp
command W :w
command Wqa :wqa
command Wq :wq


" Better auto-complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" use \d to delete to black hole register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <leader>i :JavaImport
nnoremap <leader>o :JavaImportOrganize

" Absolute and relative line number toggling
function! NumberToggle()
	if(&relativenumber == 1)
	      set number
	      set relativenumber!
	else
	    set relativenumber
	endif
endfunc

nnoremap <C-l> :call NumberToggle()<cr>

" Easymotion Shortcut
map <C-m> <leader><leader>w

" Javacomplete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java map <leader>b :call javacomplete#GoToDefinition()<CR>
