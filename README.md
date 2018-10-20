# Quick-neovim-setup

* A script for installing Neovim with some useful settings and plugins in a newly installed ubuntu 16.04 server.

## Usage

1. Clone this repository to a newly installed ubuntu 16.04 server
2. In the cloned directory, `$ chmod u+x install.sh && ./install.sh`
3. Wait until it's done (in the middle of the process, it will switch to Neovim interface, **do not interrupt it**)
4. Remove the cloned directory and use `nvim` command to enjoy it

## Note

* If you run this script in a device already installed Neovim, your old configuration files in `~/.config/nvim` will be copied to `~/.config/nvim_backup` for recovery
