#!/bin/bash

sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim
sudo apt-get install -y python-dev python-pip python3-dev python3-pip

test -d ~/.vim/bundle/Vundle.vim || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

test -d ~/.config/nvim && cp -r ~/.config/nvim ~/.config/nvim_backup || mkdir -p ~/.config/nvim

cp basic/* ~/.config/nvim

nvim +PluginInstall +qall

cp plugin/init_plugins.vim ~/.config/nvim
