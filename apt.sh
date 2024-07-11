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
	virt-top libguestfs-tools libosinfo-bin qemu-system tuned virt-manager virt-viewer wget gpg apt-transport-https

# Setup flatpak
if ! [[ $(grep flathub /var/lib/flatpak/repo/config >/dev/null) ]]; then
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	exit 1
fi

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/packages.microsoft.gpg
install -D -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | tee /etc/apt/sources.list.d/vscode.list > /dev/null

apt-get update
apt install code