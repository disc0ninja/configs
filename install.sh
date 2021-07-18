#! /bin/sh

# This script will make backups of existing config files
# in ~/.backup-dot-configs, and replace the config files
# with the config files in the git repo "github.com/disc0ninja/configs"

CLONE_LOCATION=$(pwd)
cd
mkdir .backup-dot-configs
cd .backup-dot-configs
mv ~/.bashrc ./.bashrc.back
mv ~/.zshrc ./.zshrc.back
mv ~/.alacritty.yml ./.alacritty.yml.back
mv ~/.vimrc ./.vimrc.back
ln -s $CLONE_LOCATION/.bashrc ~/.bashrc
ln -s $CLONE_LOCATION/.zshrc ~/.zshrc 
ln -s $CLONE_LOCATION/.alacritty.yml ~/.alacritty.yml  
ln -s $CLONE_LOCATION/.vimrc ~/.vimrc 

exit 0
