# Makefile for install system

include .env

MAKEFLAGS += --no-print-directory

help:
	@echo ""
	@echo "Usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  apt-update                 Updating the database of available packages"
	@echo "  apt-upgrade                Install new available packages"
	@echo "  backup-dotfiles            Backup dotfiles configuration (i3 and other)"
	@echo "  backup-profiles            Backup profile data by rsync from file spec"
	@echo "  clean                      "
	@echo "  create-user PROFILE=<user> Create user if not exist"
	@echo "  create-users               Create users (PROFILES) from .env"
	@echo "  install-all                Complete system installation for work and entertainment"
	@echo "  install-de PROFILE=<user>  Install desktop environment with i3"
	@echo "  install-dev                Install development application"
	@echo "  install-docker             Install docker and docker-compose"
	@echo "  install-chrome             Install Google Chrome browser"
	@echo "  install-package            Install all packages from files in ./pkgs folder"
	@echo "  install-sqlitebrowser      Install DB Browser for SQLite"
	@echo "  install-subl               Install Sublime Text 3 IDE"
	@echo "  install-system             System installation without development software"
	@echo "  install-virtualbox         Install VirtualBox Virtualization"
	@echo "  list-users                 List users (PROFILES) from .env"

apt-update:
	@sudo apt update

apt-upgrade:
	@sudo apt upgrade

backup-dotfiles:
	@for file in $(HOME_FILES) ; do sudo cp -r /home/$(PROFILE)/$$file $(shell pwd)/dotfiles/ ; done
	@for file in $(CONFIG_FILES) ; do sudo cp -r /home/$(PROFILE)/.config/$$file $(shell pwd)/dotfiles/ ; done
	@for file in $(BIN_FILES) ; do sudo chmod u-x $(shell pwd)/dotfiles/bin/$$file ; done

backup-profiles:
	@bash ./backup-profiles-data.sh

clean:
	@sudo apt autoclean
	@sudo apt clean
	@sudo apt autoremove

create-user:
	@if id -u $(PROFILE) >/dev/null 2>&1; then \
		echo "$(PROFILE) exist"; else sudo adduser --shell "/bin/bash" $(PROFILE); \
	fi

create-users:
	@for user in $(PROFILES) ; do make create-user PROFILE=$$user ; done

install-all:
	@make install-system install-dev clean
	@make set-group-virt

install-de:
	@for dir in $(MKDIR) ; do sudo mkdir -p /home/$(PROFILE)/$$dir ; done
	@for file in $(HOME_FILES) ; do sudo cp -r $(shell pwd)/dotfiles/$$file /home/$(PROFILE)/ ; done
	@for file in $(CONFIG_FILES) ; do sudo cp -r $(shell pwd)/dotfiles/$$file /home/$(PROFILE)/.config/ ; done
	@for file in $(BIN_FILES) ; do sudo chmod u+x /home/$(PROFILE)/bin/$$file ; done
	@if [ -d "$(shell pwd)/profiles/$(PROFILE)" ]; then \
		sudo rsync --archive $(shell pwd)/profiles/$(PROFILE) /home/; \
	fi
	@if [ -d "/home/$(PROFILE)/.vim/bundle/Vundle.vim" ]; then \
		echo "Vundle.vim exist"; \
	else \
		sudo git clone https://github.com/VundleVim/Vundle.vim.git /home/$(PROFILE)/.vim/bundle/Vundle.vim; \
	fi
	@make PROFILE=$(PROFILE) reset-owner
	@sudo usermod -a -G audio $(PROFILE)

install-dev:
	@make install-chrome install-docker install-sqlitebrowser install-subl

install-docker:
	@wget -qO - https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	@sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(DOCKER_UBUNTU_VER) stable"
	@make apt-update
	@sudo apt install docker-ce docker-compose
	@make set-group-docker
	@sudo systemctl enable docker.service

install-chrome:
	@wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	@sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	@make apt-update
	@sudo apt install google-chrome-stable

install-sqlitebrowser:
	@sudo add-apt-repository -y ppa:linuxgndu/sqlitebrowser
	@make apt-update
	@sudo apt install sqlitebrowser

install-subl:
	@wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	@sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
	@make apt-update
	@sudo apt install sublime-text

install-system:
	@make apt-update apt-upgrade install-package create-users
	@sudo cp $(shell pwd)/files/background-ubuntu.png /usr/share/ukui-greeter/images/background-ubuntu.png
	@for user in $(PROFILES) ; do make install-de PROFILE=$$user ; done
	@for direct in $(MNT_DIR) ; do sudo mkdir /mnt/$$direct ; done

install-package:
	@for file in $(shell ls -d $(PWD)/pkgs/*); do xargs -a $$file sudo apt install ; done

install-virtualbox:
	@wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
	@wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
	@sudo sh -c 'echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(UBUNTU_VER) contrib" >> /etc/apt/sources.list.d/virtualbox.list'
	@make apt-update
	@sudo apt install virtualbox

list-users:
	@for user in $(PROFILES) ; do echo $$user ; done

reset-owner:
	@sudo chown -Rf $(PROFILE):$(shell id -g -n $(PROFILE)) "/home/$(PROFILE)"

set-group-docker:
	@for user in $(PROFILES) ; do sudo usermod -a -G docker $$user ; done

set-group-virt:
	@for user in $(PROFILES) ; do sudo usermod -a -G libvirt $$user ; done

