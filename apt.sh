#!/bin/bash

source ./functions.sh

apt clean && apt update && apt_assume_yes dist-upgrade
reboot_required

apt_install solaar dconf-editor \
	curl vim neovim ripgrep zsh build-essential \
	vainfo gparted ca-certificates mesa-vdpau-drivers \
	mesa-va-drivers mesa-va-drivers unrar gnome-shell-extension-manager \
	flatpak gnome-software-plugin-flatpak xdotool build-essential qemu-kvm \
	libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon \
	virt-top libguestfs-tools libosinfo-bin qemu-system tuned virt-manager virt-viewer

# Setup flatpak
if ! [[ $(grep flathub /var/lib/flatpak/repo/config >/dev/null) ]]; then
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	exit 1
fi
