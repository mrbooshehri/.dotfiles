" __  __      _                     _          _          _
"|  \/  |_ __| |__   ___   ___  ___| |__   ___| |__  _ __(_)
"| |\/| | '__| '_ \ / _ \ / _ \/ __| '_ \ / _ \ '_ \| '__| |
"| |  | | |  | |_) | (_) | (_) \__ \ | | |  __/ | | | |  | |
"|_|  |_|_|  |_.__/ \___/ \___/|___/_| |_|\___|_| |_|_|  |_|
"
"
"-------------------------------------------- Vundle init set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Pugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chrisbra/colorizer'
Plugin 'dylanaraps/wal.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'rwxrob/vim-pandoc-syntax-simple'
Plugin 'tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required

" pandoc
let g:pandoc#formatting#mode = 'h' " A'
let g:pandoc#formatting#textwidth = 72
"let g:pandoc#syntax#codeblocks#embeds#langs = ["markdown=pandoc", "bash", "python", "yaml", "vim"]

"---------------------------------------- my init
syntax enable                           " Enables syntax highlighing
colorscheme wal
"highlight Normal ctermbg=Black
"highlight NonText ctermbg=Black
"highlight Search ctermbg=blue
"highlight SpellBad ctermbg=red
set hidden                              " Required to keep multiple buffers open multiple buffers
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                        " treat dash separated words as a word text object"
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set number                              " Line numbers
"set cursorline                          " Enable highlighting of the current line
"set cursorcolumn                        " Enable highlighting of the current column 
set background=dark                     " tell vim what the background color looks like
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions=cro			" Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set laststatus=2                        " Always display the status line
set noshowmode                          " We don't need to see things like -- INSERT -- anymore

"---------------------------------------- synastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"---------------------------------------- nerdtree
map <silent> <C-o> :NERDTreeFocus<CR>

"---------------------------------------- airline config
" enable tabline                                                                                                                 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"---------------------------------------- lightline config

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"---------------------------------------- custom keybindings
vnoremap <C-c> "+y
map <C-p> "+p


"---------------------------------------- aliases
"nmap gm :LivedownToggle<CR>
nmap ch :ColorHighlight<CR>
" markdonw preview
nnoremap <silent>  gm :execute 'silent !pandoc % -t pdf \| zathura - &' \| redraw<CR>

"---------------------------------------- coc keybindings
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <Ctrl-F> to format documents with prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
noremap <C-F> :Prettier<CR>

