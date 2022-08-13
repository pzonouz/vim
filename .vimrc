syntax on
filetype plugin indent on
" set background=dark
" colorscheme dracula 
set mouse=a
let mapleader=" "

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
			\ 'do': 'yarn install --frozen-lockfile --production',
			\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'| Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'AndrewRadev/tagalong.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'frazrepo/vim-rainbow'
" Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/tagbar'
Plug 'docunext/closetag.vim'
Plug 'preservim/nerdtree', {'on':'NERDTreeToggle'}
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'gko/vim-coloresque'
Plug 'flazz/vim-colorschemes'
Plug 'farmergreg/vim-lastplace'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-easy-align'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'vim-autoformat/vim-autoformat'
Plug 'sainnhe/edge'
Plug 'dracula/vim'
Plug 'ayu-theme/ayu-vim'
" Plug 'miyakogi/conoline.vim'

call plug#end()

nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
let g:ale_sign_warning = '⚠️'
let g:ale_sign_error = '❌'
let g:ale_fixers = {'javascript': ['eslint']}
" Fix files automatically on save
let g:ale_fix_on_save = 1
nmap <F6> <Plug>(ale_fix)

"fzf
nnoremap <CV-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>
"coc
nmap <buffer> <leader>gd <Plug>(coc-definition)
nmap <buffer> <leader>gr <Plug>(coc-references)
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"My own config
au BufWritePre *.html,*.css,*.js :Prettier<CR>
nnoremap <Leader>vs :so ~/.vimrc<CR>
nnoremap <Leader>ve :vsplit  ~/.vimrc<CR>
noremap  <F5> :NERDTreeToggle<CR>
xmap ga <Plug>(EasyAlign)
noremap <F2> :Autoformat<CR>
au BufWritePre *.c,*.cpp,*.py :Autoformat
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
noremap <c-left> <c-w><
noremap <c-right> <c-w>>
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-down> <c-w>down
noremap <c-up> <c-w>up
noremap <c-right> <c-w>right
noremap <c-left> <c-w>left
set number!
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
let &t_SI.="\e[6 q"
let &t_EI.="\e[6 q"

" let g:indent_guides_enable_on_vim_startup = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

"commentary
autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal commentstring={/*\ %s\ */}

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Floaterm
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
