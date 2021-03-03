#!/usr/bin/env bash

echo -e "\e[1;35;40mBACKUP {Music,Videos,profiles,opt,etc}\e[0m"

echo -e "\n\e[1;31mMUSIC\e[0m"
rsync -ahrv --delete \
    /home/$USER/Music/ /mnt/disk/Music/

echo -e "\n\e[1;31mVIDEOS\e[0m"
rsync -ahrv \
    /home/$USER/Videos/ /mnt/disk/Videos/

echo -e "\n\e[1;31mPROFILES\e[0m"
sudo rsync -ahrv --delete --files-from=backup/profiles \
    /home/ /mnt/encrypted/profiles/

echo -e "\n\e[1;31mOPT\e[0m"
sudo rsync -ahrv --delete --files-from=backup/opt \
    /opt/ /mnt/encrypted/opt/

echo -e "\n\e[1;31mETC\e[0m"
sudo rsync -ahrv --delete --files-from=backup/etc \
    /etc/ /mnt/encrypted/etc/
