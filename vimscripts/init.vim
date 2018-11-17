set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Put your non-Plugin stuff after this line

" Run other vim script if exists
if !empty(glob("~/.config/nvim/settings.vim"))
    source ~/.config/nvim/settings.vim
endif
if !empty(glob("~/.config/nvim/mappings.vim"))
    source ~/.config/nvim/mappings.vim
endif
if !empty(glob("~/.config/nvim/plugins.vim"))
    source ~/.config/nvim/plugins.vim
endif
if !empty(glob("~/.config/nvim/functions.vim"))
    source ~/.config/nvim/functions.vim
endif
