dotfiles
========

Configuration files for i3 window manager

<p align="center">
<img src="http://i.imgur.com/y5sjnXN.jpg" alt="desktop" /> 
<br/>
<i>This is how my desktop looks like as of August 2016</i>
</p>

Installation
------------

### Archlinux

##### X.org

    $ yaourt -S xorg-xrdb

##### Fonts

    $ yaourt -S ttf-dejavu terminus-font ttf-font-awesome
<br/>
##### i3

    $ yaourt -S i3-gaps-git rofi python-themer-git dotrix feh compton dex
    
##### mpd
    
    $ yaourt -S python-mpd2 mpd ncmpcpp mpc
    
##### py3status
    
    $ yaourt -S i3status py3status py3status-modules

Setup
-----

    $ git clone https://github.com/goodmind/dotfiles.git && cd dotfiles
    $ dest=$HOME ./bootstrap.sh
