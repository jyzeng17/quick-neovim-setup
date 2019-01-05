" Easier way to move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" More natural way to move cursor in long lines
nnoremap j gj
nnoremap k gk

" Easier way to enter command
" (remove for now, wanna use its original function,
" which is repeating the last seach action)
"nnoremap ; :
" Insert new line in normal mode
nnoremap <CR> moo<Esc>d0x`o
" More intuitive way to insert tabs
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >
vnoremap <S-Tab> <
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

" Auto-completion for brackets
inoremap {<CR> {<CR>}<Esc>ko

let mapleader = ","
"#################################################
" Leader key mappings from amix/vimrc
"#################################################

" Nerdtree shortcuts
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>

" Disable search highlight
map <silent> <leader><cr> :noh<cr>

" Switch CWD to the directory of the open buffer and print new CWD
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Toggle paste mode (disable autoindentation and other string handlings,
" useful for pasting code segment from somewhere else)
map <leader>pp :setlocal paste!<cr>
"#################################################

" Plugin shortcuts
nmap <leader>tt :TagbarToggle<CR>

" Close current buffer
map <leader>bd :bdelete<cr>

" Easier way to save
nnoremap <leader>w :w<CR>
inoremap <leader>w <Esc>:w<CR>

" Easier way to quit
nnoremap <leader>q :q<CR>
inoremap <leader>q <Esc>:q<CR>
tnoremap <leader>q <C-\><C-n>:q<CR>

" Easier way to force quit
nnoremap <leader>Q :q!<CR>
inoremap <leader>Q <Esc>:q!<CR>

" Easier way to refresh current buffer
nnoremap <leader>e :e<CR>
