# sndset
Script to switch sound devices in FreeBSD.
Created: qua 29 set 2021 16:39:22 -03

I’ve created this script to help switch devices. 

My window manager (ctwm) doesn’t do this task automagically. 

I need to change it when switching pcm, usb, bt, etc. 

When plugging/unplugging devices they appears in dmesg tail and
the list of /dev/sndstat is updated accordingly.

So I've create this tool to provide me some comfort on doing it.