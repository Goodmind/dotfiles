dotfiles
========

Configuration files for i3 window manager

<p align="center">
<img src="https://cloud.githubusercontent.com/assets/3275424/10715366/17f0064a-7b36-11e5-964b-03029475895c.png" alt="desktop" />
<br/>
<i>This is how my desktop looks like as of october 2015</i>
</p>
<br/>

Installation
------------

### Archlinux

##### Fonts
    
    $ yaourt -S ttf-dejavu terminus-font

<br/>
<br/>

##### i3

    $ yaourt -S i3-gaps-git rofi python-themer-git dotrix feh
    
##### mpd
    
    $ yaourt -S python-mpd2 mpd ncmpcpp
    
##### py3status
    
    $ yaourt -S py3status py3status-modules

Setup
-----

    $ git clone https://github.com/goodmind/dotfiles.git && cd dotfiles
    $ dest=$HOME ./bootstrap.sh
