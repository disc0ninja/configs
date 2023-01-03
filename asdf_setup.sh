#!/bin/bash


get_asdf(){
 git clone https://github.com/asdf-vm/asdf.git ~/.asdf
 [ "$SHELL" == "/usr/bin/zsh" ] && echo ". $HOME/.asdf/asdf.sh" >>~/.zshrc || echo ". $HOME/.asdf/asdf.sh" >>~/.bashrc
}
add_plugin(){
  asdf plugin-add "$1"
}

set_plugin_version(){
  asdf global "$1" "$2"

}

install_program(){
  add_plugin "$1"
  asdf install "$1" "$2"
  set_plugin_version "$1" "$2"
}

# check for files
[ -d ~/.asdf ] || get_asdf
[ -f ~/.tool-versions ] || touch ~/.tool-versions

install_program nodejs lts
install_program golang 1.19.4
