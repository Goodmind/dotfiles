#!/bin/bash

src=`pwd`
dest="${dest:-~/builds/dotfiles-dest}"

echo "Source directory is: $src"
echo "Destination directory is: $dest"

dotrix --src $src --dst $dest $@
