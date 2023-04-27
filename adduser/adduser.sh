#!/bin/bash
useradd -s /bin/bash -d /home/$1/ -m -G sudo $1

mkdir /home/$1/.ssh/
chmod 0700 /home/$1/.ssh/

touch /home/$1/.ssh/authorized_keys
chmod 600 /home/$1/.ssh/authorized_keys

chown -R $1:$1 /home/$1/.ssh/
chown -R $1:root /home/$1/.ssh/*

echo "%$1  ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$1
chmod 440 /etc/sudoers.d/$1
