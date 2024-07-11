#!/bin/bash

dir=$(pwd)
source ./functions.sh

# APT packages
sudo -s source $dir/apt.sh

# Terminal setup
if ! [[ $(grep starship ~/.bashrc) ]]; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
  echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi

if ! [[ $(dconf list /org/gnome/terminal/legacy/profiles:/ | grep b1dcc9dd-5262-4d8d-a863-c897e6d979b9) ]]; then
  dconf load /org/gnome/terminal/legacy/profiles:/ < terminalProfiles.dconf
  dconf list /org/gnome/terminal/legacy/profiles:/
fi


# Flatpak packages
source $dir/flatpak.sh

# Dock Setup
source $dir/dock.sh

# Setup Bottles
source $dir/bottles.sh

# KVM https://linux.how2shout.com/how-to-install-kvm-qemu-on-ubuntu-24-04-lts-server-linux/
sudo usermod -aG libvirt $(whoami) && sudo usermod -aG kvm $(whoami)
sudo systemctl enable --now libvirtd
sudo systemctl enable --now libvirtd
sudo setfacl -m d:u:$USER:rwx /var/lib/libvirt/images

# Steam

# SteamTinkerLaunch
git clone
cd steamtinkerlaunch
sudo make install
steamtinkerlaunch yad ai