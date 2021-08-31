#! /bin/sh

# Remove all dot files that found in this repo from the
# user's home directory. 

# NOTE: to uninstall and replace with the backup dot files
# created when the install script was last run use revert.sh

rm "$HOME"/.vimrc "$HOME"/.bashrc "$HOME"/.alacritty.yml "$HOME"/.zshrc "$HOME"/.local/bin/quick_search
