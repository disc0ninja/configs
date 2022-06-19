#!/usr/bin/env bash

copy_dots() {
  # will copy all files that are _ filename (eg _file1)
  # to . filename in the home directory, and additionally
  # recursively copies the files/dirs inside of XDG_CONFIG
  # to either $XDG_CONFIG_HOME or ~/.config.
  # takes an argument that will be fed to grep -v.
  # use this to ignore dot files on specific targets.
    pushd dots
    ls |grep '^_' |grep -v "$1" | sed "p;s|\_|$HOME/\.|" | xargs -n2 cp
    if [[ -n $XDG_CONFIG_HOME ]]; then
      cp -r XDG_CONFIG/* $XDG_CONFIG_HOME/.config/
    else
      cp -r XDG_CONFIG/* $HOME/.config/
    fi
    popd
}

case $OSTYPE in
  "linux-gnu")
    # bash_profile is configred with macos specific bash config
    # and will be skipped on Linux hosts.
    copy_dots "bash_profile"
    ;;
  "darwin")
    # bashrc is configred with Linux specific bash config
    # and will be skipped on macos hosts.
    copy_dots "bashrc"
    ;;
  *)
    echo "Not currently supporting $OSTYPE"
    # currently only concerned with Linux and macos. To try to get
    # this working on Windows/other OS determine the return
    # type of $OSTYPE and additional cases to the statement.
    exit 1
esac
