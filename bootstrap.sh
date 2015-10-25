#!/bin/bash

src=`pwd`
dest="${dest:-~/builds/dotfiles-dest}"

folders=(
  ".config/i3"
  ".config/i3status"
  ".config/mpd"
  ".config/ncmpcpp"
  ".config/themer"
)

echo "Source directory is: $src"
echo "Destination directory is: $dest"

for f in "${folders[@]}"
do
    mkdir -p "$dest"/$f
done

dotrix --src $src --dst $dest $@

themer render all
themer activate rain

ln -s "$dest"/.config/themer/current/i3.conf "$dest"/.config/i3/config
