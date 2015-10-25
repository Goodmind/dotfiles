#!/bin/bash

src=`pwd`
dest="${dest:-~/builds/dotfiles-dest}"

echo "Source directory is: $src"
echo "Destination directory is: $dest"

dotrix --src $src --dst $dest $@
themer render all
ln -s ~/.config/themer/current/i3.conf ~/.config/i3/config
