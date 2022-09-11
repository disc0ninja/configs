#!/usr/bin/env bash

# will copy all files that are _ filename (eg _file1)
# to . filename in the home directory, and additionally
# recursively copies the files/dirs inside of XDG_CONFIG
# to either $XDG_CONFIG_HOME or ~/.config.
determine_dots(){
  find $PWD -name '_*' | sed "p;s|$PWD/\_|$HOME/\.|"
}

backup_and_remove(){
  [[ -e ${1}.bak || -h ${1}.bak || -d ${1}.bak ]] && rm -r "${1}.bak"
  if [[ -e $1 || -h $1 || -d $1 ]]; then
    cp -Lr "$1" "${1}.bak"
    rm -r $1
  fi
}

configs(){
  for conf in $(ls -A XDG_CONFIG);do
    backup_and_remove "${1}/${conf}"
  done
}

pushd "dots"
# make backups of the current dots
for dot in $(determine_dots | xargs -n 2 | cut -f2 -d' ');do
  backup_and_remove $dot
done

# create fresh symlinks to the repo dots
determine_dots | xargs -n 2 ln -s

if [[ -n $XDG_CONFIG_HOME ]]; then
  configs $XDG_CONFIG_HOME
  ln -s $PWD/XDG_CONFIG/* $XDG_CONFIG_HOME/.config/
else
  configs $HOME/.config
  ln -s $PWD/XDG_CONFIG/* $HOME/.config/
fi
popd
