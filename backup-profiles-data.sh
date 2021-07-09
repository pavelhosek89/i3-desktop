#!/usr/bin/env bash

echo -e "\e[1;35;40mBACKUP {etc,opt,profiles,Music,Videos}\e[0m"

BACKUP_FOLDER="/mnt/encrypted/$(hostname)"
FILE_ETC="backup/etc"
FILE_OPT="backup/opt"
FILE_PROFILES="backup/profiles"

if [ -d "$BACKUP_FOLDER" ]; then
	if [ -f "$FILE_ETC" ]; then
		echo -e "\n\e[1;31mETC\e[0m"
		sudo rsync -ahrv --delete --files-from=$FILE_ETC \
		    /etc/ $BACKUP_FOLDER/etc/
	fi

	if [ -f "$FILE_OPT" ]; then
		echo -e "\n\e[1;31mOPT\e[0m"
		sudo rsync -ahrv --delete --files-from=$FILE_OPT \
		    /opt/ $BACKUP_FOLDER/opt/
	fi

	if [ -f "$FILE_PROFILES" ]; then
		echo -e "\n\e[1;31mPROFILES\e[0m"
		sudo rsync -ahrv --delete --files-from=$FILE_PROFILES \
		    /home/ $BACKUP_FOLDER/profiles/
	fi
fi

echo -e "\n\e[1;31mMUSIC\e[0m"
rsync -ahrv \
    /home/$USER/Music/ /mnt/disk/Music/

echo -e "\n\e[1;31mVIDEOS\e[0m"
rsync -ahrv \
    /home/$USER/Videos/ /mnt/disk/Videos/
