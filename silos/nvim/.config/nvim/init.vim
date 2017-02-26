let $VIM        = expand('~/.config/nvim/')
let $TMP        = expand($VIM . 'tmp/')
let $BUNDLES    = expand($VIM . 'bundle/')

let g:author = 'Adam Rutkowski <hq@mtod.org>'

if !isdirectory($TMP)
  call mkdir($TMP, "p")
endif

call plug#begin($BUNDLES)
Plug 'ElmCast/elm-vim', {'for': 'elm'}
Plug 'FooSoft/vim-argwrap'
Plug 'airblade/vim-rooter'
Plug 'benekastah/neomake'
Plug 'chase/vim-ansible-yaml'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir', {'for': ['eelixir', 'elixir']}
Plug 'exu/pgsql.vim'
Plug 'gcmt/wildfire.vim'
Plug 'google/vim-searchindex'
Plug 'guns/vim-sexp', {'for': ['clojure', 'racket']}
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'janko-m/vim-test'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'jreybert/vimagit', {'branch': 'master'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kenvifire/vim-hdl'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mhinz/vim-signify'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/tslime.vim'
Plug 'skwp/greplace.vim'
Plug 'slashmili/alchemist.vim', {'for': 'elixir'}
Plug 'stephpy/vim-yaml'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-ft-clojure', {'for': 'clojure'}
Plug 'thinca/vim-qfreplace'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-classpath', {'for': 'clojure'}
Plug 'tpope/vim-endwise', {'for': ['elixir', 'ruby']}
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat', {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': ['clojure', 'racket']}
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'venantius/vim-cljfmt', {'for': 'clojure'}
Plug 'vim-erlang/vim-erlang-compiler', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-omnicomplete', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-runtime', {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-tags', {'for': 'erlang'}
Plug 'wellle/targets.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'wlangstroth/vim-racket', {'for': 'racket'}
Plug 'yuttie/comfortable-motion.vim'
Plug 'zhaocai/GoldenView.Vim'
call plug#end()

set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

set termguicolors

let g:sexp_filetypes = 'clojure,scheme,lisp,racket'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:erlang_tags_ignore = '_build'
let g:filebeagle_show_hidden=1
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:goldenview__enable_default_mapping = 0
let g:signify_line_highlight = 0
let g:signify_mapping_next_hunk = ']c'
let g:signify_mapping_prev_hunk = '[c'
let g:signify_skip_filetype = { 'diff': 1 }
let g:signify_update_on_focusgained = 1
let g:sql_type_default = 'pgsql'
let g:tslime_ensure_trailing_newlines = 2
let g:vim_markdown_folding_disabled = 1
let g:rooter_patterns = ['mix.exs', '.git/']

let mapleader=" "
nnoremap <leader><space> :Commands<CR>
set shell=/bin/zsh

set background=dark
colorscheme dumbo

syntax sync minlines=256

inoremap jk <Esc>

set clipboard=unnamed

vmap > >gv
vmap < <gv
nnore> >>
nnore< <<

nnoremap j gj
nnoremap k gk

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

set number
set relativenumber

set backspace=indent,eol,start

set ignorecase
set smartcase
set gdefault

set splitright

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=4

set textwidth=79
set nowrap

set hlsearch
set incsearch

set more
set cmdheight=3
set hidden
set nosol

set scrolloff=3
set sidescrolloff=3

set synmaxcol=256
set cpoptions+=$

set showmatch
set matchtime=5

set notimeout
set ttimeout
set ttimeoutlen=10

set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete

set fillchars=stl:\ ,stlnc:۰,vert:\ ,fold:\ ,diff:\

set statusline=
set statusline +=\ \ ↳\ \ %<%t%* " full path
set statusline +=%#error#%m%*     " modified flag
set statusline +=\ %#error#%{StatuslineTrailingSpaceWarning()}%*
set statusline +=\ %#error#%{LocListCountSevere()}%*
set statusline +=%=%*     " separator
set statusline +=%#diffchange#%{fugitive#head()}%*
set statusline +=\ %y%*   " file type

autocmd InsertLeave,BufWritePost * unlet! b:statusline_trailing_space_warning

function! StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")
    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = 'TWS'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif
  return b:statusline_trailing_space_warning
endfunction

function! LocListCountSevere()
  let ll_count = 0
  for entry in getloclist(0)
    if entry.type == "E" || entry.type == "W" || entry.type == ""
      let ll_count = ll_count + 1
    endif
  endfor
  if ll_count > 0
    return "[LL: " . ll_count . "]"
  else
    return ""
  endif
endfunction

set wildmenu
set wildignorecase
set wildmode=list:full
set wildignore+=.hg,.git,.svn,rel
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.spl
set wildignore+=*.DS_Store
set wildignore+=*.luac
set wildignore+=migrations
set wildignore+=*.pyc
set wildignore+=*.beam
set wildignore+=_build
set wildignore+=deps

set colorcolumn=80

nnoremap H gT
nnoremap L gt

nnoremap 0 ^
nnoremap ^ 0

cnoremap <C-a> <home>
cnoremap <C-e> <end>
cnoremap <C-f> <right>
cnoremap <C-b> <left>

nnoremap # #<C-o>

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bD :call delete(expand('%'))<CR>:bdelete!<CR>

nnoremap <leader>ll :lopen<CR>

nnoremap <silent> <C-w>\| <C-W>v
nnoremap <silent> <C-w>- <C-W>s

nnoremap <leader>r :%s/\<<C-r><C-w>\>/

nnoremap <silent> <leader>fs :update<CR>

nnoremap <Backspace> <C-^>

nnoremap <silent> // :nohlsearch<CR>

nnoremap <leader>fed :e $MYVIMRC<CR>
nnoremap <leader>feR :source %<CR>

nnoremap <leader>qa :qa<CR>
nnoremap <leader>qA :qa!<CR>

nnoremap ? :echo
      \ "hi<" . synIDattr(synID(line("."),col("."),1),"name")
      \ . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name")
      \ . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
      \ . ">"<CR>

nnoremap <leader>? :echo expand("%:p")<CR>
nnoremap gcd :lcd %:p:h<CR>:pwd<CR>

nnoremap <Leader>tg :call atags#generate()<cr>

function! Preserve(command)
  let _s=@/
  let l = line(".")
  let c = col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfunction

nmap <leader>i :call Preserve("normal gg=G")<CR>
nmap <leader>C :call Preserve("%s/\\s\\+$//e")<CR>

set backup
set backupdir=$TMP
set history=5000
set noswapfile
set undodir=$TMP
set undofile
set undolevels=5000

set laststatus=2

set list
set listchars=
set lcs+=tab:▸\
set lcs+=trail:▫
set lcs+=extends:›
set lcs+=precedes:‹
set lcs+=nbsp:·
set lcs+=eol:¬

set showbreak=↪\

nnoremap <leader>o <C-o>
nnoremap <leader>i <C-i>

nnoremap <leader>gs :Gstatus<CR>

nnoremap <leader>gr :!git rebase -i --autosquash HEAD~
nnoremap <leader>gfx :Gcommit %<CR>ifixup!<space>
nnoremap <leader>gd :Gdiff<CR>

augroup defaults
  autocmd!
  autocmd VimResized * :wincmd =

  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

augroup spell
  autocmd!
  autocmd FileType gitcommit setlocal spell
  autocmd FileType markdown setlocal spell
augroup END

augroup git
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
  autocmd BufReadPost fugitive://*
        \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
        \   nnoremap <buffer> .. :edit %:h<CR> |
        \ endif
  autocmd FileType gitrebase nnoremap <buffer> <leader>r ^cwreword<ESC>
  autocmd FileType gitrebase nnoremap <buffer> <leader>s ^cwsquash<ESC>
  autocmd FileType gitrebase nnoremap <buffer> <leader>f ^cwfixup<ESC>
augroup END

set mouse=a

au FocusLost * :silent! wall

let g:fzf_files_options = '--preview "head -'.&lines.' {}"'
let g:fzf_buffers_jump = 1

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

command! ProjectFiles exe "Files " . systemlist('git rev-parse --show-toplevel')[0]

function! s:chdir_git_root()
  let git_root = systemlist('git rev-parse --show-toplevel')[0]
  exe "cd" git_root
  exe "lcd" git_root
  echomsg "(GitRoot) " . git_root
endfunction
command! GitRoot call s:chdir_git_root()

nnoremap <leader>pf :ProjectFiles<CR>
nnoremap <leader>pb :Buffers<CR>
nnoremap <leader>pt :Tags<CR>
nnoremap <leader>bc :BCommits<CR>
nnoremap <leader>ag :GitRoot<CR>:Rg!<CR>
nnoremap <leader>ch :History:<CR>

nnoremap <leader>grd :terminal git rebase -i develop<CR>
nnoremap <leader>grm :terminal git rebase -i master<CR>
nnoremap <leader>M :MagitOnly<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)a

nnoremap <C-P> @:

set diffopt+=foldcolumn:0

vnoremap @ :norm@

augroup cline
  au!
  au WinLeave,InsertEnter * set nocursorline
  au WinEnter,InsertLeave * set cursorline
augroup END

nmap n nzz
nmap N Nzz

set showcmd

