dotfiles
========

Installation
------------

### Archlinux

#### Fonts
    
    $ yaourt -S ttf-dejavu terminus-font





#### i3

    $ yaourt -S i3-gaps-git rofi python-themer-git dotrix feh
    
#### mpd
    
    $ yaourt -S python-mpd2 mpd ncmpcpp
    
#### py3status
    
    $ yaourt -S py3status py3status-modules

Setup
-----

    $ git clone https://github.com/goodmind/dotfiles.git && cd dotfiles
    $ dest=$HOME ./bootstrap.sh
