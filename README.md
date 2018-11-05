# quick-neovim-setup

* A shell script for installing Neovim with some useful settings and plugins in Ubuntu 16.04 or higher version

## What Exactly The Script Does

1. Install Neovim via Ubuntu PPA server if not installed yet
2. Install Vundle plugin if not installed yet
3. Install [ctags](https://github.com/universal-ctags/ctags) as Tagbar plugin's dependency if not installed yet
3. Copy the vim scripts to the corresponding path
	* If the corresponding path directory already exists, make a copy of it (See [Note](#note))
4. Install other plugins in the vim scripts via Vundle

## Usage

1. Clone this repository to a ubuntu 16.04 device
2. In the cloned directory, `$ chmod u+x install.sh && ./install.sh`
3. Wait until it's done (in the middle of the process, it will switch to Neovim interface, **do not interrupt it**)
4. Remove the cloned directory and use `nvim` command to enjoy it

## Note

* The original `~/.config/nvim` will be copied to `~/.config/nvim_backup`

## Environment

* OS: Ubuntu 16.04 or higher version
* Neovim: 0.3.0
