#!/bin/sh

# Install dependencies
sudo apt-get update
sudo apt-get install bluez pulseaudio-module-bluetooth python-gobject python-gobject-2

# Enable Source,Sink,Media; but only once
grep -i "^Enable" /etc/bluetooth/main.conf
if [ "$?" = "0" ] ; then
   sudo sed -i 's/Enable=.*/Enable=Source,Sink,Media/' /etc/bluetooth/main.conf
else
   sudo sed -i 's/\[General\]/[General]\nEnable=Source,Sink,Media/' /etc/bluetooth/main.conf
fi
