#!/bin/bash

echo "[info] checking git......"
if ! [ -x "$(command -v git)" ]; then
	sudo apt-get install -y git
	echo "[info] git installed"
else
	echo "[info] git already installed"
fi

echo "[info] checking Neovim......"
if ! [ -x "$(command -v nvim)" ]; then
	echo "[info] checking apt-add-repository......"
	if ! [ -x "$(command -v apt-add-repository)" ]; then
		sudo apt-get install -y software-properties-common
		echo "[info] apt-add-repository installed"
	else
		echo "[info] apt-add-repository already installed"
	fi
	sudo apt-add-repository -y ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install -y neovim
	sudo apt-get install -y python-dev python-pip python3-dev python3-pip
	echo "[info] Neovim installed"
else
	echo "[info] Neovim already installed"
fi

echo "[info] checking Vundle......"
if ! [ -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "[info] Vundle installed"
else
	echo "[info] Vundle already installed"
fi

echo "[info] checking backup directory......"
if [ -d ~/.config/nvim_backup ]; then
	echo "[error] \"~/.config/nvim_backup\" already exists. Change its name or move it somewhere else and run the script again."
	exit 1
else
	echo "[info] backup directory checked"
fi

echo "[info] checking nvim directory......"
if [ -d ~/.config/nvim ]; then
	cp -r ~/.config/nvim ~/.config/nvim_backup
	echo "[info] old nvim directory's been copied to nvim_backup directory for recovery"
else
	mkdir -p ~/.config/nvim
	echo "[info] nvim directory generated"
fi

cp basic/* ~/.config/nvim
nvim +PluginInstall +qall
cp plugin/init_plugins.vim ~/.config/nvim
echo "[info] successfully completed!"
exit 0
