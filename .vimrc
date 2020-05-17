" === Basic Setup ===
" general
set autoread
set clipboard+=unnamedplus
set colorcolumn=80
set fillchars+=vert:│
set mouse=a
set nofoldenable
set noshowmode
set nowrap
set shortmess=tIF
set wildmenu
set inccommand=split

" line numbers
set cursorline
set number
set numberwidth=2
set relativenumber

" syntax highlighting
filetype plugin indent on
syntax enable

" searching
set ignorecase
set showmatch
set smartcase

" tab-key settings
set autoindent
set expandtab
set shiftround
set shiftwidth=2
set softtabstop=2

" ctags
set tags=tags

" show invisibles
set list
set listchars=tab:￫\ ,trail:·,extends:»,precedes:«,nbsp:␣

" Auto file indentation for ruby and erb files.
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" === Keybindings ===
let mapleader=" "

" type `jj` or `jk` in any mode to toss you into normal mode.
inoremap jj <esc>
inoremap jk <esc>

" split window navigation.
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
set splitbelow
set splitright

" double-space toggles between the last buffer and the current buffer.
map <leader><leader> <C-^>

"tabs
map <leader>tn :tabnew<cr>
map <leader>t<leader> :tabnext
map <leader>tm :tabmove
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

" terminal
tnoremap <C-\> <C-\><C-n>

" clear highlight
nnoremap <silent> <C-n> :nohl<CR>

" spell-check toggle is <leader> o
map <leader>o :setlocal spell! spelllang=en_us<CR>

" coc
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()

" dash
nmap <silent> <leader>d <Plug>DashSearch

" fuzzyfinder
nnoremap <C-p> :FZF<CR>
" fuzzy find files in the working directory (where you launched Vim from)
nmap <leader>f :Files<cr>
" fuzzy find lines in the current file
nmap <leader>/ :BLines<cr>
" fuzzy find an open buffer
nmap <leader>b :Buffers<cr>
" fuzzy find text in the working directory
nmap <leader>r :Rg<Space>
" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nmap <leader>c :Commands<cr>
" fuzzy find hisotry items
nmap <leader>h :History<CR>
" fuzzy find Bookmarks
nmap <leader>' :Marks<CR>
" fuzzy find Tags
nmap <leader>t :BTags<CR>
nmap <leader>T :Tags<CR>

" fugitive
nmap <leader>gb :Gblame<CR>
nmap <leader>gg :Gbrowse<CR>
nmap <leader>gs :Gstatus<CR>


" undotree
nnoremap <leader>u :UndotreeToggle<CR>

" === Plugins ===
" install with :PlugInstall.
call plug#begin('~/.config/nvim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'alvan/vim-closetag'
Plug 'andymass/vim-tradewinds'
Plug 'bogado/file-line'
Plug 'chrisbra/csv.vim'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'jiangmiao/auto-pairs'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'ludovicchabant/vim-gutentags'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'raimondi/delimitmate'
Plug 'rizzatti/dash.vim'
Plug 'sheerun/vim-polyglot'
Plug 'slim-template/vim-slim'
Plug 'stephpy/vim-yaml'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'w0rp/ale'
" Devicons must be last loaded plugin
Plug 'ryanoasis/vim-devicons'
call plug#end()

" === Theme setup ===
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

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

" closetag
let g:closetag_filetypes = 'html, eruby'

" ranger
map <leader>rr :RangerEdit<CR>
map <leader>rv :RangerVSplit<CR>
map <leader>rs :RangerSplit<CR>
map <leader>rt :RangerTab<CR>
map <leader>ri :RangerInsert<CR>
map <leader>ra :RangerAppend<CR>
map <leader>rc :set operatorfunc=RangerChangeOperator<CR>g@

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
let g:Hexokinase_ftEnabled = ['html', 'css', 'scss', 'sass', 'javascript']

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
