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
" More intuitive way to insert tabs
nnoremap <Tab> >>
vnoremap <Tab> >
" An alternative way to leave insert mode
inoremap ,, <Esc>
" Easier way to leave terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap ,, <C-\><C-n>
" Easier way to leave visual mode
vnoremap ,, <Esc>

" Arrow keys are BAD
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Easier way to switch between buffers
nnoremap <S-h> :bp<CR>
nnoremap <S-l> :bn<CR>

" Easier way to save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Easier way to quit
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>
tnoremap <C-q> <C-\><C-n>:q<CR>

" Auto-completion for brackets
inoremap {<CR> {<CR>}<Esc>ko

" Plugin shortcuts
map <C-n> :NERDTreeToggle<CR>
nmap <C-t> :TagbarToggle<CR>
