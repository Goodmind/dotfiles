dotfiles
========

Configuration files for i3 window manager

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/3275424/11303687/f2760262-8fc5-11e5-90cd-a30d7a367644.png" alt="desktop" />
<br/>
<i>This is how my desktop looks like as of November 2015</i>
</p>

Installation
------------

### Archlinux

##### Fonts
    
    $ yaourt -S ttf-dejavu terminus-font
<br/>
##### i3

    $ yaourt -S i3-gaps-git rofi python-themer-git dotrix feh compton
    
##### mpd
    
    $ yaourt -S python-mpd2 mpd ncmpcpp mpc
    
##### py3status
    
    $ yaourt -S py3status py3status-modules

Setup
-----

    $ git clone https://github.com/goodmind/dotfiles.git && cd dotfiles
    $ dest=$HOME ./bootstrap.sh
