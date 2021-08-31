#! /bin/bash

# This script will make backups of existing config files
# in "$HOME"/.backup-dots, and replace the config files
# with the config files in the git repo "github.com/disc0ninja/configs"

CLONE_LOCATION=$(pwd)
# make a directory to store backup dotfiles
# and back up the dotfiles.
# then make symlinks from the dotfiles here
# to "$HOME"/.$dotfile
mkdir "$HOME"/.backup-dots
for dotfile in .alacritty.yml .bashrc .vimrc .zshrc 
do
  if [[ -e "$HOME"/$dotfile ]]
  then
    mv "$HOME"/$dotfile "$HOME"/.backup-dots/$dotfile.bak
  fi
  ln -s "$CLONE_LOCATION"/$dotfile "$HOME"/$dotfile
done

mkdir -p "$HOME"/.local/bin
ln -s "$CLONE_LOCATION"/quick_search.sh "$HOME"/.local/bin/quick_search

exit 0
