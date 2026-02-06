#!/bin/bash

useradd josef --create-home --shell /bin/bash --user-group
usermod -a -G sudo josef
echo 'josef:hunter2' | chpasswd
mkdir /home/josef/.ssh/
chown josef:josef /home/josef/.ssh/
chmod 0700 /home/josef/.ssh/
cat /etc/homelab* > /home/josef/.ssh/authorized_keys
chown josef:josef /home/josef/.ssh/authorized_keys
chmod 0600 /home/josef/.ssh/authorized_keys
rm /etc/homelab*
ssh-keygen -A  # to generate ssh host keys, which are missing for some reason
systemctl restart ssh
