#!/bin/bash

if ! [ -x "$(command -v git)" ]; then
	sudo apt-get install -y git
fi

if ! [ -x "$(command -v nvim)" ]; then
	if ! [ -x "$(command -v apt-add-repository)" ]; then
		sudo apt-get install -y software-properties-common
	fi
	sudo apt-add-repository -y ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install -y neovim
	sudo apt-get install -y python-dev python-pip python3-dev python3-pip
fi

test -d ~/.vim/bundle/Vundle.vim || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

backup_exists = test -d ~/.config/nvim_backup
if [ "${backup_exists}" -eq "0"]; then
	echo "Error: The \"~/.config/nvim_backup\" already exists. Change its name or move it somewhere else and run the script again."
	exit 1
fi

test -d ~/.config/nvim && cp -r ~/.config/nvim ~/.config/nvim_backup || mkdir -p ~/.config/nvim

cp basic/* ~/.config/nvim

nvim +PluginInstall +qall

cp plugin/init_plugins.vim ~/.config/nvim

exit 0
