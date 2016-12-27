#!/bin/sh

# Install dependencies
sudo apt-get update
sudo apt-get install bluez pulseaudio-module-bluetooth python-gobject python-gobject-2

# Enable Source,Sink,Media,Socket; but only once
grep -i "^Enable" /etc/bluetooth/main.conf
if [ "$?" = "0" ] ; then
   sudo sed -i 's/Enable=.*/Enable=Source,Sink,Media,Socket/' /etc/bluetooth/main.conf
else
   sudo sed -i 's/\[General\]/[General]\nEnable=Source,Sink,Media,Socket/' /etc/bluetooth/main.conf
fi

# Set Class = 0x00041C
sudo sed -i 's/#*Class *=.*/Class = 0x00041C/' /etc/bluetooth/main.conf

# Set resample-method = trivial
sudo sed -i -r 's/^.*resample-method *=.*/resample-method = trivial/' /etc/pulse/daemon.conf
