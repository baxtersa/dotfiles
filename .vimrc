set nocompatible
set runtimepath+=~/.nvim/dein/repos/github.com/Shougo/dein.vim
set termguicolors
set number
set expandtab
set shiftwidth=4
set tabstop=4

call dein#begin(expand('~/.nvim/dein')) " plugins' root path
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/vimproc.vim',{'build': 'make'})
call dein#add('vim-syntastic/syntastic')
call dein#add('morhetz/gruvbox')
call dein#add('vim-airline/vim-airline')
call dein#add('scrooloose/nerdtree')
call dein#add('leafgarland/typescript-vim')
call dein#add('Quramy/tsuquyomi')
call dein#add('rhysd/vim-clang-format')

call dein#end()
call dein#save_state()

colorscheme gruvbox
set background=dark

" JS configuration
let g:syntastic_javascript_checkers=['jshint']

" Markdown configuration
au BufRead,BufNewFile *.md setlocal textwidth=80

" Source custom keybinding configuration
so ~/.nvim/keybindings.vim

filetype plugin indent on
syntax enable
