dotfiles
========

Configuration files for i3 window manager

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/3275424/14023180/627cf508-f20d-11e5-969e-678e816dd056.png" alt="desktop" />
<br/>
<i>This is how my desktop looks like as of March 2016</i>
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
