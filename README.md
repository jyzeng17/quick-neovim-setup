# quick-neovim-setup

* A script for installing Neovim with some useful settings and plugins in Ubuntu 16.04

## Functions

1. Install Neovim via Ubuntu PPA server if not installed yet
2. Install Vundle plugin if not installed yet
3. Copy the vim scripts to the corresponding path
	* If the corresponding path directory already exists, make a replica of the it for backup
	* If the backup replica already exists, abort the process
4. Install the plugins in the vim scripts

## Usage

1. Clone this repository to a ubuntu 16.04 device
2. In the cloned directory, `$ chmod u+x install.sh && ./install.sh`
3. Wait until it's done (in the middle of the process, it will switch to Neovim interface, **do not interrupt it**)
4. Remove the cloned directory and use `nvim` command to enjoy it

## Note

* If you run this script in a device already installed Neovim, your old configuration files in `~/.config/nvim` will be copied to `~/.config/nvim_backup` for recovery

## Version

* The script should work fine in a Ubuntu 16.04 server/desktop environment
* The vim scripts should work fine in Neovim 0.3.0
