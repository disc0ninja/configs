#!/usr/bin/env bash

# will copy all files that are _ filename (eg _file1)
# to . filename in the home directory, and additionally
# recursively copies the files/dirs inside of XDG_CONFIG
# to either $XDG_CONFIG_HOME or ~/.config.
pushd "dots"
ls | grep '^_' | sed "p;s|\_|$HOME/\.|" | xargs -n2 cp
if [[ -n $XDG_CONFIG_HOME ]]; then
  cp -r XDG_CONFIG/* $XDG_CONFIG_HOME/.config/
else
  cp -r XDG_CONFIG/* $HOME/.config/
fi
popd
