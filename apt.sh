#!/bin/bash

source ./functions.sh

apt clean && apt update && apt_assume_yes dist-upgrade
reboot_required

apt_install solaar \
	curl vim neovim ripgrep zsh \
	build-essential vainfo gparted \
	ca-certificates mesa-vdpau-drivers mesa-va-drivers mesa-va-drivers \
	unrar gnome-shell-extension-manager flatpak gnome-software-plugin-flatpak

# Setup flatpak
if ! [[ $(grep flathub /var/lib/flatpak/repo/config >/dev/null) ]]; then
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	exit 1
fi