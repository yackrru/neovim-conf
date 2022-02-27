scriptencoding utf-8
set encoding=utf-8

"-----------------------------------------------
" Color settings
"-----------------------------------------------
set background=dark
set t_Co=256
set cursorline
set hlsearch
set spell
set spelllang=en,cjk
colorscheme monokai
let g:solarized_termcolors=256
hi Search cterm=none,bold ctermfg=black ctermbg=230
hi CursorLine cterm=none ctermbg=238
hi LineNr cterm=none ctermfg=230, ctermbg=239
hi Visual cterm=bold ctermfg=black ctermbg=magenta
hi SpellBad cterm=underline ctermfg=white ctermbg=58

" Status bar with airline
set laststatus=2
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#branch#enabled = 0
let g:airline_theme = 'tomorrow'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#buffer_idx_format = {
  \ '0': '0 ',
  \ '1': '1 ',
  \ '2': '2 ',
  \ '3': '3 ',
  \ '4': '4 ',
  \ '5': '5 ',
  \ '6': '6 ',
  \ '7': '7 ',
  \ '8': '8 ',
  \ '9': '9 '
  \ }
" let g:airline#extensions#default#layout = [
"   \ [ 'a', 'c', 'b' ],
"   \ [ 'x', 'y', 'z', 'error', 'warning']
"   \ ]

"-----------------------------------------------
" Basic settings
"-----------------------------------------------
let mapleader=";"           " The <leader> key
set number                  " Enable row number
set hidden                  " Allow buffers to be opened when a file is being edited but not saved
set autoread                " Enable autoload external changes
set backspace=indent,start
set clipboard+=unnamed      " Enable clipboard sharing
set nobackup
set ambiwidth=double        " Prevent character corruption
set visualbell              " Use visual bell to notify us
set noerrorbells            " Silent error bells
set virtualedit+=block      " Allow cursor to move to the end of the line.

" For display
set list
set listchars=trail:-,nbsp:%,precedes:<
set showmatch    " Highlight matching braces
set matchtime=1

" For format
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" For search
set incsearch   " Enable incremental search
set ignorecase  " Not case-sensitive
set smartcase   " Case-sensitive only when searching for mixed-case words
set wrapscan    " After finishing the last search, move to the top

" For cli mode
set wildmenu               " Enable completion by Tab-key
set wildmode=list:longest
set wildignorecase         "Not case-sensitive

"-----------------------------------------------
" Key mappings
"-----------------------------------------------
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
vnoremap j gj
vnoremap k gk
vnoremap gj j
vnoremap gk k
inoremap <C-f> <Right>
inoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-g> <C-f>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"-----------------------------------------------
" Plugin settings
"-----------------------------------------------
let NERDTreeShowHidden=1 " Show hidden files on NERDTree window.

" Completion
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sources', [
  \ 'around',
  \ 'vim-lsp',
  \ 'file'
  \ ])
call ddc#custom#patch_global('sourceOptions', {
  \ '_': {
  \   'matchers': ['matcher_head'],
  \   'sorters': ['sorter_rank'],
  \   'converters': ['converter_remove_overlap'],
  \ },
  \ 'around': {'mark': 'Around'},
  \ 'vim-lsp': {
  \   'mark': 'LSP', 
  \   'matchers': ['matcher_head'],
  \   'forceCompletionPattern': '\.|:|->|"\w+/*'
  \ },
  \ 'file': {
  \   'mark': 'file',
  \   'isVolatile': v:true, 
  \   'forceCompletionPattern': '\S/\S*'
  \ }})
call ddc#enable()
