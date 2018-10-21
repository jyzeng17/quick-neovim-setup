#!/bin/bash

# Check arguments
if [ "$#" -gt 1 ]; then
	echo "[Info] Usage: ./install.sh [-f]"
	echo "[Info] Arguments: -f: Ignore existed backup directory."
	echo "[Error] Invalid arguments."
	exit 1
elif [ "$#" -eq 1 ] && [ "${1}" != "-f" ]; then
	echo "[Info] Usage: ./install.sh [-f]"
	echo "[Info] Arguments: -f: Ignore existed backup directory."
	echo "[Error] Invalid arguments."
	exit 1
fi

echo -n "[Info] Checking git...... "
if ! [ -x "$(command -v git)" ]; then
	sudo apt-get install -y git
	echo "installed."
else
	echo "already installed."
fi

echo "[Info] Checking Neovim...... "
if ! [ -x "$(command -v nvim)" ]; then
	echo -n "[Info] Checking apt-add-repository...... "
	if ! [ -x "$(command -v apt-add-repository)" ]; then
		sudo apt-get install -y software-properties-common
		echo "installed."
	else
		echo "already installed."
	fi
	sudo apt-add-repository -y ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install -y neovim
	sudo apt-get install -y python-dev python-pip python3-dev python3-pip
	echo "[Info] ...... Neovim installed."
else
	echo "[Info] ...... Neovim already installed."
fi

echo -n "[info] Checking Vundle...... "
if ! [ -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "installed."
else
	echo "already installed."
fi

echo -n "[Info] Checking backup directory...... "
if [ -d ~/.config/nvim_backup ] && [ "$#" -eq 0 ]; then
	echo -e "\n[Error] \"~/.config/nvim_backup\" already exists. Change its name or move it somewhere else. Or run the script with -f argument to ignore this error."
	exit 1
else
	echo "checked."
fi

echo -n "[Info] Checking nvim directory...... "
if [ -d ~/.config/nvim ]; then
	cp -r ~/.config/nvim ~/.config/nvim_backup
	echo "old directory's been copied to backup directory."
else
	mkdir -p ~/.config/nvim
	echo "generated."
fi

cp basic/* ~/.config/nvim
echo -n "[Info] Switch to Neovim to install plugins...... "
nvim +PluginInstall +qall
echo "done."
cp plugin/init_plugins.vim ~/.config/nvim
echo "[Info] Successfully completed!"
exit 0
