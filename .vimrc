set nocompatible
set runtimepath+=~/.nvim/dein/repos/github.com/Shougo/dein.vim
set termguicolors
set cursorline
set number
set expandtab
set shiftwidth=2
set tabstop=2

" Leader binding
let g:mapleader=' '

call dein#begin(expand('~/.nvim/dein')) " plugins' root path
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/vimproc.vim',{'build': 'make'})
call dein#add('vim-syntastic/syntastic')
" themes
call dein#add('morhetz/gruvbox')
call dein#add('joshdick/onedark.vim')
call dein#add('rakr/vim-one')
" languages
call dein#add('leafgarland/typescript-vim')
call dein#add('Quramy/tsuquyomi')
call dein#add('rhysd/vim-clang-format')
call dein#add('fatih/vim-go')
call dein#add('rust-lang/rust.vim')
call dein#add('vim-scripts/groovy.vim')
" misc
call dein#add('vim-airline/vim-airline')
call dein#add('scrooloose/nerdtree')
call dein#add('mhinz/vim-startify')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('ntpeters/vim-better-whitespace')
call dein#add('vimwiki/vimwiki')
call dein#add('itchyny/calendar.vim')

call dein#end()
call dein#save_state()

"" gruvbox
"colorscheme gruvbox
"let g:gruvbox_contrast_dark='hard'
"set background=dark

" onedark.vim
colorscheme onedark
set background=dark

" Startify configuration
let g:startify_change_to_dir=0
let g:startify_relative_path=1
let g:startify_list_order=[
            \ ['   Most Recently Used'],
            \ 'dir',
            \ 'bookmarks',
            \ 'sessions',
            \ 'commands'
            \ ]

" JS configuration
let g:syntastic_javascript_checkers=['jshint']
" TS configuration
let g:tsuquyomi_auto_open=1
let g:tsuquyomi_disable_quickfix=1
let g:syntastic_typescript_checkers=['tsuquyomi']
" C++ configuration
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options='-std=c++11 -Werror'
let g:syntastic_cpp_check_header=1

" Markdown configuration
au BufRead,BufNewFile *.md setlocal textwidth=80
" TeX configuration
au BufRead,BufNewFile *.tex setlocal textwidth=80
" Wiki configuration
au BufRead,BufNewFile *.wiki setlocal textwidth=80

" Source custom keybinding configuration
so ~/.nvim/keybindings.vim

filetype plugin indent on
syntax enable
