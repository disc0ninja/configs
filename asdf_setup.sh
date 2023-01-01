#!/bin/bash

# check for files
[ -d ~/.asdf ] || git clone https://github.com/asdf-vm/asdf.git ~/.asdf
[ -f ~/.tool-versions ] || touch ~/.tool-versions

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

install_program nodejs lts
install_program golang 1.19.4
install_program deno 1.29.1
