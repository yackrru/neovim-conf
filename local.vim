scriptencoding utf-8
set encoding=utf-8

" For system
let g:python_host_prog = system('echo -n $(which python)')
let g:python3_host_prog = system('echo -n $(which python)')

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
set listchars=tab:>.,trail:-,nbsp:%,precedes:<
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
nnoremap <Space> :b#<CR>
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

" tig with neovim-remote
let nvrcmd      = "nvr --remote-wait"
let $VISUAL     = nvrcmd
let $GIT_EDITOR = nvrcmd
nnoremap <silent> <Leader>t :<C-u>silent call <SID>tig()<CR>

function! s:tig() abort
  call s:open_term('tig')
endfunction

function! s:open_term(cmd) abort
  let split = s:split_type()
  call execute(printf('%s term://%s', split, a:cmd))
  autocmd FileType gitcommit,gitrebase,gitconfig setlocal bufhidden=delete
  setlocal noswapfile
  setlocal nobuflisted
endfunction

function! s:split_type() abort
  let width = winwidth(win_getid())
  let height = winheight(win_getid()) * 2.1
  if height > width
    return 'split'
  else
    return 'vsplit'
  endif
endfunction

"-----------------------------------------------
" FileType settings
"-----------------------------------------------
augroup filetypedetect
  au BufRead,BufNewFile *.go setfiletype go
  au BufRead,BufNewFile *.md setfiletype markdown
  au BufRead,BufNewFile *.php setfiletype php
  au BufRead,BufNewFile *.py setfiletype python
  au BufRead,BufNewFile *.rb setfiletype ruby
  au BufRead,BufNewFile *.toml setfiletype toml
  au BufRead,BufNewFile *.vim setfiletype vim
augroup END

"-----------------------------------------------
" Plugin settings
"-----------------------------------------------
" For NERDTree
let NERDTreeShowHidden=1 " Show hidden files on NERDTree window.

" For lsp
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0 " Disable linter warnings in insert mode
let g:lsp_text_edit_enabled = 1
let g:asyncomplete_popup_delay = 200
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> <leader>d <plug>(lsp-definition)
  nmap <buffer> <leader>f <plug>(lsp-document-format)
  nmap <buffer> <leader>h <plug>(lsp-hover)
  nmap <buffer> <leader>i <plug>(lsp-implementation)
  nmap <buffer> <leader>n <plug>(lsp-rename)
  nmap <buffer> <leader>r <plug>(lsp-references)
endfunction
augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_settings = {
  \   'pylsp-all': {
  \     'workspace_config': {
  \       'pylsp': {
  \         'configurationSources': ['flake8'],
  \         'plugins': {
  \           'flake8': {
  \             'enabled': 1
  \           },
  \           'mccabe': {
  \             'enabled': 0
  \           },
  \           'pycodestyle': {
  \             'enabled': 0
  \           },
  \           'pyflakes': {
  \             'enabled': 0
  \           }
  \         }
  \       }
  \     }
  \   }
  \ }
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
highlight link LspWarningHighlight Error

function! s:findRoot(target)
  let dir = getcwd()
  while 1
    let files = split(globpath(l:dir, '*'), '\n')
    for f in l:files
      if a:target == fnamemodify(f, ':t')
        return l:dir
      endif
    endfor
    if l:dir == "/"
      break
    endif
    let dir = fnamemodify(l:dir, ':h')
  endwhile
  return ""
endfunction

function! s:setVenv()
  let dir = s:findRoot('Pipfile')
  echo l:dir
  if dir != ""
    let $VIRTUAL_ENV = trim(system("cd " . l:dir . "; pipenv --venv"))
  endif
endfunction
autocmd FileType python call s:setVenv()

" For markdown
let g:vim_markdown_folding_disabled = 1
let g:previm_enable_realtime = 1 " Enable reflecting automatically
let g:previm_open_cmd = 'open' " Open default browser
