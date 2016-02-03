#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

#fontpath
xset +fp /usr/share/fonts/bitmap
xset +fp /usr/share/fonts/local

#update keybindings
xmodmap ~/.xmodmap 
#set the background
#feh --bg-fill ~/pictures/hexcamo.png &
hsetroot -full ~/pictures/sleepykittens11.jpg & 

#get rid of stupid cross pointer
xsetroot -cursor_name left_ptr

#uncomment for 2bwm
#2bwm &
#exec urxvt

#########
#wmutils#
#########
#sxhkd -c ~/Downloads/wmutils/sxhkd/sxhkdrc &
#sxhkd &
#bar.sh &
#wew | yawee &
#exec urxvt

#######
#bspwm#
#######
exec bspwm

