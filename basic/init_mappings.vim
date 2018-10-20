" Easier way to move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" More natural way to move cursor in long lines
nnoremap j gj
nnoremap k gk

" Easier way to enter command
nnoremap ; :
" Insert new line in normal mode
nnoremap <CR> o<Esc>k
" More intuitive way to insert tab in normal mode
nnoremap <Tab> >>
" An alternative way to leave insert mode
inoremap ,, <Esc>
" Easier way to leave terminal mode
tnoremap <Esc> <C-\><C-n>

" Arrow keys are BAD
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Easier way to switch between buffers
nnoremap <S-h> :bp<CR>
nnoremap <S-l> :bn<CR>
