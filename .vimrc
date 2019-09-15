" === Basic Setup ===
" general
set autoread
set clipboard+=unnamedplus
set colorcolumn=80
set fillchars+=vert:│
set mouse=a
set nofoldenable
set noshowmode
set shortmess=tIF
set wildmenu

" line numbers
set cursorline
set number
set numberwidth=2
set relativenumber

" searching
set ignorecase
set showmatch
set smartcase

" tab settings
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2

" show invisibles
set list
set listchars=tab:￫\ ,trail:·,extends:»,precedes:«,nbsp:␣

" Auto file indentation for ruby and erb files.
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" === Keybindings ===
let mapleader=" "

" type `jj` or `jk` in Insert mode to toss you into normal mode.
inoremap jj <esc>
inoremap jk <esc>

" easy navigation between split windows.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" clear highlight
nnoremap <silent> <C-n> :nohl<CR>

" coc
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()

" dash
nmap <silent> <leader>d <Plug>DashSearch

" emmet
let g:user_emmet_expandabbr_key = '<C-a>,'
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby EmmetInstall

" fuzzyfinder
nnoremap <C-p> :FZF<CR>
" fuzzy find files in the working directory (where you launched Vim from)
nmap <leader>f :Files<cr>
" fuzzy find lines in the current file
nmap <leader>/ :BLines<cr>
" fuzzy find an open buffer
nmap <leader>b :Buffers<cr>
" fuzzy find text in the working directory
nmap <leader>r :Rg
" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nmap <leader>c :Commands<cr>
" fuzzy find hisotry items
nmap <leader>h :History<CR>
" fuzzy find Bookmarks
nmap <leader>' :Marks<CR>

" fugitive
nmap <leader>gb :Gblame<CR>
nmap <leader>gg :Gbrowse<CR>
nmap <leader>gs :Gstatus<CR>


" undotree
nnoremap <leader>u :UndotreeToggle<CR>

" === Plugins ===
" install with :PlugInstall.
call plug#begin('~/.config/nvim/plugged')
Plug 'RRethy/vim-hexokinase'
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'jiangmiao/auto-pairs'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'raimondi/delimitmate'
Plug 'rbgrouleff/bclose.vim'
Plug 'rizzatti/dash.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'w0rp/ale'
call plug#end()

" === Theme setup ===
set termguicolors
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox
syntax enable

" === Plugin Settings ===
" ruby
let ruby_spellcheck_strings = 1

" airline
let g:airline_theme='gruvbox'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#gutentags#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''

" rainbow parenthesis
let g:rainbow_active = 1

" ale
let g:ale_sign_column_always = 1
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1
let g:ale_set_highlights = 0
let g:ale_set_signs = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '✻'

" gitgutter
set updatetime=250
set signcolumn=yes
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '▸'
let g:gitgutter_sign_removed_first_line = '▸'
let g:gitgutter_sign_modified_removed = '▸'

" hexokinase
let g:Hexokinase_ftAutoload = ['css', 'scss']

" set specific linters.
let g:ale_linters = {
\   'ruby': ['standardrb', 'rubocop'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

" set ale fixers.
let g:ale_fixers = {
\    'ruby': ['standardrb'],
\    'javascript': ['eslint'],
\    'vue': ['eslint'],
\    'scss': ['prettier']
\}
let g:ale_fix_on_save = 1

" disable for specific files.
let g:ale_pattern_options = {
\   'schema.rb': {'ale_enabled': 0},
\   'structure.sql': {'ale_enabled': 0},
\}

" only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" === Functions ===
function! DeleteTrailingWhitespace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd BufWrite * :call DeleteTrailingWhitespace()
autocmd BufLeave,FocusLost * silent! wa
