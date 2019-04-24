# quick-neovim-setup

* A script for installing Neovim along with some useful plugins and basic settings in Ubuntu.

### Introduction

> It only works on Ubuntu 16.04/18.04

The script will do the following tasks:

1. Install Neovim via Ubuntu PPA server
2. Install Vundle plugin
3. Install [ctags](https://github.com/universal-ctags/ctags) as Tagbar plugin's dependency
4. Copy the provided vim scripts files to `~/.config/nvim`
	* If the directory already exists, the original content will be moved to `~/.config/nvim_backup`
5. Install other plugins in the provided vim scripts via Vundle

### Usage

1. Clone this repository
2. Under the cloned directory, `$ sudo ./install.sh`
3. Wait for the installing process to be done
	* Do not interrupt it when switching to Neovim's interface
	* The message `successfully completed!` will show up when the whole process has finished
4. Try `$ nvim` to see if everything works properly
