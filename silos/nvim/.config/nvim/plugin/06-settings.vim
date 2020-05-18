set clipboard+=unnamedplus
set cmdheight=2
set colorcolumn=80
set completeopt+=preview
set cpoptions+=$
set expandtab
set hidden
set icm=nosplit
set matchtime=5
set nonumber
set norelativenumber
set nosol
set noswapfile
set notimeout
set scrolloff=2
set shiftwidth=2
set shortmess+=c
set showbreak=↪\
set showmatch
set sidescrolloff=3
set softtabstop=2
set splitright
set tabstop=4
set textwidth=79
set ttimeout
set ttimeoutlen=10
set undofile
set undolevels=5000
set updatetime=300
set wildmode=list,full
set wrap

set statusline=
set statusline +=\ %{StatuslineTrailingSpaceWarning()}%*
set statusline +=\ %<%t%*
set statusline +=\ %#error#%m%* " modified flag
set statusline +=%=%* " separator
set statusline +=%{fugitive#head()}%*
set statusline +=\ %y%* " file type
set statusline +=\ %4l:%2c " line no/column, padded

set list
set listchars=
set lcs+=tab:▸\ 
set lcs+=trail:▫
set lcs+=extends:›
set lcs+=precedes:‹
set lcs+=nbsp:·
set lcs+=eol:¬

set previewheight=50
