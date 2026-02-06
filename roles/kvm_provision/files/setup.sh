#!/bin/bash

useradd josef --create-home --shell /bin/bash --user-group
usermod -a -G sudo josef
echo 'josef:hunter2' | chpasswd
