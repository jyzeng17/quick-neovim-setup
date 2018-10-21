#!/bin/bash

if [ "$#" -gt 0 ]; then
	echo "Usage: ./install.sh"
	exit 1
fi

echo -n "checking for git... "
if ! [ -x "$(command -v git)" ]; then
	echo "no"
	sudo apt-get install -y git
else
	echo "yes"
fi

echo -n "checking for Neovim... "
if ! [ -x "$(command -v nvim)" ]; then
	echo "no"
	echo -n "checking for apt-add-repository... "
	if ! [ -x "$(command -v apt-add-repository)" ]; then
		echo "no"
		sudo apt-get install -y software-properties-common
	else
		echo "yes"
	fi
	sudo apt-add-repository -y ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install -y neovim
	sudo apt-get install -y python-dev python-pip python3-dev python3-pip
else
	echo "yes"
fi

echo -n "checking for Vundle... "
if ! [ -d ~/.vim/bundle/Vundle.vim ]; then
	echo "no"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
	echo "yes"
fi

echo -n -e "checking if \"~/.config/nvim\" exists... "
if [ -d ~/.config/nvim ]; then
	echo "yes"
	echo -n -e "checking if \"~/.config/nvim_backup\" exists... "
	if [ -d ~/.config/nvim_backup ] && [ "$#" -eq 0 ]; then
		echo -n "yes. "
		read -p "Do you want to override it? [y/n] " answer
		until [ "$answer" == "y" ] || [ "$answer" == "Y" ] || [ "$answer" == "n" ] || [ "$answer" == "N" ]
		do
			read -p "Invalid answer. Do you want to override the existed backup directory? [y/n] " answer
		done
		if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; then
			cp -r ~/.config/nvim ~/.config/nvim_backup
		else
			echo "Aborted."
			exit 1
		fi
	else
		echo "no"
		cp -r ~/.config/nvim ~/.config/nvim_backup
	fi
else
	echo "no"
	mkdir -p ~/.config/nvim
fi

# Tagbar's dependency
echo -n "checking for ctags... "
if ! [ -x "$(command -v ctags)" ]; then
	echo "no"
	git clone https://github.com/universal-ctags/ctags.git
	cd ctags
	echo -n "checking for autoreconf... "
	if ! [ -x "$(command -v autoreconf)" ]; then
		echo "no"
		sudo apt-get -y install dh-autoreconf
	else
		echo "yes"
	fi
	echo -n "checking for pkg-config... "
	if ! [ -x "$(command -v pkg-config)" ]; then
		echo "no"
		sudo apt-get -y install pkg-config
	else
		echo "yes"
	fi
	./autogen.sh
	./configure
	make
	sudo make install
	cd ../
else
	echo "yes"
fi

cp basic/* ~/.config/nvim

echo -n "switching to Neovim to install plugins... "
nvim +PluginInstall +qall
echo "done"

cp plugin/init_plugins.vim ~/.config/nvim

echo "successfully completed!"
exit 0
