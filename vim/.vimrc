" __  __      _                     _          _          _
"|  \/  |_ __| |__   ___   ___  ___| |__   ___| |__  _ __(_)
"| |\/| | '__| '_ \ / _ \ / _ \/ __| '_ \ / _ \ '_ \| '__| |
"| |  | | |  | |_) | (_) | (_) \__ \ | | |  __/ | | | |  | |
"|_|  |_|_|  |_.__/ \___/ \___/|___/_| |_|\___|_| |_|_|  |_|
"
"
"-------------------------------------------- Vundle init set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Pugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'turbio/bracey.vim'		" plugin for live html, css, and javascript editing in vim
Plugin 'scrooloose/syntastic'		" Syntastic is a syntax checking plugin for Vim
Plugin 'preservim/nerdtree'		" The NERDTree is a file system explorer for the Vim editor
Plugin 'kien/rainbow_parentheses.vim'	" Better Rainbow Parentheses
Plugin 'airblade/vim-gitgutter'		" A Vim plugin which shows a git diff in the sign column
Plugin 'jiangmiao/auto-pairs'		" Insert or delete brackets, parens, quotes in pair.
Plugin 'junegunn/fzf'			" fzf is a general-purpose command-line fuzzy finder.
Plugin 'tpope/vim-surround'		" Surround.vim is all about : parentheses, brackets, quotes, XML tags, and more
Plugin 'mg979/vim-visual-multi'		" multi cursor
Plugin 'morhetz/gruvbox'		" gruvbox is heavily inspired by badwolf, jellybeans and solarized.
Plugin 'prettier/vim-prettier'		" A vim plugin wrapper for prettier, pre-configured with custom default prettier settings.
Plugin 'jacoborus/tender.vim'		" A 24bit colorscheme for Vim, Airline and Lightline 
Plugin 'myusuf3/numbers.vim'		" numbers.vim is a vim plugin for better line numbers
Plugin 'habamax/vim-gruvbit'		" gruvbit colorscheme
Plugin 'rakr/vim-one'			" one colorscheme
Plugin 'connorholyday/vim-snazzy'	" snazzy colorscheme
Plugin 'RohanPoojary/pleasant.vim'	" pleasant colorsheme
Plugin 'ryanoasis/vim-devicons'		" vim icon
Plugin 'vim-airline/vim-airline'	" airline
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/unite.vim'		" search
Plugin 'lilydjwg/colorizer'
Plugin 'yggdroot/indentline'		" indent indicator
Plugin 'xolox/vim-notes'		" note taking
Plugin 'xolox/vim-misc'			" note taking
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'vimwiki/vimwiki'
Plugin 'shime/vim-livedown'		" markdown preview
Plugin 'neoclide/coc.nvim', {'branch': 'release'} " COC 

call vundle#end()            " required
filetype plugin indent on    " required

"---------------------------------------- gruvbox config
let g:gruvbox_contrast_dark = 'hard'	" soft hard medium
let g:gruvbox_guisp_fallback='bg'

"---------------------------------------- my init
syntax enable                           " Enables syntax highlighing
colorscheme gruvbox
"highlight Normal ctermbg=Black
"highlight NonText ctermbg=Black
highlight Search ctermbg=blue
highlight SpellBad ctermbg=red
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
set cursorline                          " Enable highlighting of the current line
set cursorcolumn                        " Enable highlighting of the current column 
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
let g:airline_theme = 'gruvbox'

"---------------------------------------- lightline config

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"---------------------------------------- custom keybindings
vnoremap <C-c> "+y
map <C-p> "+p

"---------------------------------------- LaTeX preview
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'zathura -'

"---------------------------------------- automations
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

"---------------------------------------- vimwiki
