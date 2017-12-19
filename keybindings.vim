" Use tab to switch buffer
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" NERDTree shortcuts
nnoremap <Leader>ft :NERDTreeToggle<CR>

" Find shortcuts
nnoremap <Leader>s :find

" Insert-Mode Meta binding
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l
inoremap <A-h> <C-o>h
inoremap <A-}> <C-o>}
inoremap <A-{> <C-o>{
inoremap <A-o> <C-o>o
inoremap <A-O> <C-o>O
inoremap <A-w> <C-o>w
inoremap <A-e> <C-o>e
inoremap <A-b> <C-o>b
inoremap <A-$> <C-o>$
inoremap <A-0> <C-o>0
inoremap <A-u> <C-o>u
inoremap <A-d> <C-o>dw
inoremap <A-D> <C-o>D
inoremap <A-;> <C-o>:

" Split-pane navigation
nnoremap <silent> <Leader>\| :wincmd v<CR>
nnoremap <silent> <Leader>- :wincmd h<CR>
nnoremap <silent> <Leader>wl :wincmd l<CR>
nnoremap <silent> <Leader>wk :wincmd k<CR>
nnoremap <silent> <Leader>wj :wincmd j<CR>
nnoremap <silent> <Leader>wh :wincmd h<CR>
nnoremap <silent> <Leader>wq :wincmd q<CR>

imap kj <Esc>

" TS keybindings
autocmd FileType typescript nmap <buffer> <Leader>t :<C-u>echo tsuquyomi#hint()<CR>
" Go keybindings
autocmd FileType go nmap <Leader>t <Plug>(go-info)
