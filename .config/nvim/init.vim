" ---------------------------------------------------------------------
" Vim-Plug
" ---------------------------------------------------------------------
" Install vim-plug if not present.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

  " Easy switch between single line and multiline code (gS and gJ)
  Plug 'AndrewRadev/splitjoin.vim'
  " Glorious statusline
  Plug 'itchyny/lightline.vim', { 'do': ':set noshowmode' }
  " Autopairing of characters []{}()""''
  Plug 'jiangmiao/auto-pairs'
  " For the inner writer...
  Plug 'junegunn/goyo.vim'
  " Colorize all text in the form of #rrggbb
  Plug 'lilydjwg/colorizer'
  " Parenthesis/Quotes (and tags) as text objects
  Plug 'tpope/vim-surround'

  " Syntax for various languages
  Plug 'StanAngeloff/php.vim'
  Plug 'cespare/vim-toml'
  Plug 'elixir-editors/vim-elixir'
  Plug 'fatih/vim-go'
  Plug 'kchmck/vim-coffee-script'
  Plug 'mxw/vim-jsx'
  Plug 'othree/html5.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'plasticboy/vim-markdown'
  Plug 'rust-lang/rust.vim'
  Plug 'tikhomirov/vim-glsl', { 'for': ['glsl', 'vert', 'lua'] }
  Plug 'tpope/vim-git'
  Plug 'HerringtonDarkholme/yats.vim'
  " Plug 'peitalin/vim-jsx-typescript'
  " Plug 'leafgarland/typescript-vim'
  " Plug 'sirtaj/vim-openscad'
  Plug 'mhinz/vim-mix-format'

  " Coloschemes
  Plug 'dreamtigers/pseudokai'
  Plug 'morhetz/gruvbox'
  Plug 'vim-scripts/wombat'
  Plug 'dracula/vim',{'as':'dracula'}
  Plug 'srcery-colors/srcery-vim'

call plug#end()

" ---------------------------------------------------------------------
" :options
" ---------------------------------------------------------------------
" 2 Moving around, searching and patterns
set incsearch
set ignorecase
set smartcase

" 4 Displaying text
set nowrap
set number

" 5 Syntax, highlighting and spelling
set background=dark
set hlsearch
set termguicolors
" set cursorline
" set colorcolumn=+1

" 6 Multiple windows
set splitbelow
set splitright

" 9 Using the mouse
if has('mouse')
  set mouse=a
endif

" 11 Messages and info
set showcmd
set noshowmode

" 13 Editing text
set undofile

" 14 Tabs and indenting
set shiftwidth=4
set softtabstop=4
set noexpandtab
" Filetype indent should be the one handling indentation.
" set smartindent

" Shows the effects of a command incrementally as you type. (nvim only)
if has('nvim')
  set inccommand=nosplit
endif

" Others
" Allow different indentations per filetype.
filetype plugin indent on

" On save, remove trailing whitespace.
" autocmd BufWritePre * :%s/\s\+$//e

" Uncomment the following to have Vim jump to the last position when
" reopening a file (taken from /usr/share/vim/vim*/vimrc_example.vim)
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

" ---------------------------------------------------------------------
" vim-go
" ---------------------------------------------------------------------
" Don't show the error message saying I'm running an old version of Vim
let g:go_version_warning = 0

" ---------------------------------------------------------------------
" Goyo.vim
" ---------------------------------------------------------------------
let g:goyo_width='80'
let g:goyo_height='100%'
function! s:goyo_enter()
  setlocal textwidth=78
  setlocal formatoptions+=a formatoptions-=l
  if exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  set textwidth&
  set formatoptions&
  if exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ---------------------------------------------------------------------
" vim-markdown
" ---------------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1

" ---------------------------------------------------------------------
" gruvbox
" ---------------------------------------------------------------------
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'

" ---------------------------------------------------------------------
" srcery
" ---------------------------------------------------------------------
let g:srcery_italic = 1
let g:srcery_inverse_matches = 1

" ---------------------------------------------------------------------
" lightline
" ---------------------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'srcery',
  \ 'active': {
  \   'left': [['mode', 'paste'], ['readonly', 'relativepath', 'modified']]
  \ }
  \}

" ---------------------------------------------------------------------
" Colors and syntax
" ---------------------------------------------------------------------
" In color console, enable coloring and search highlighting.
if &t_Co > 2 || has("gui_running")
  syntax enable
endif

silent! colorscheme srcery
" vim: shiftwidth=2 softtabstop=2 expandtab
