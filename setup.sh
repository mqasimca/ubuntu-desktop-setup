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
sudo -s source $dir/flatpak.sh

# Dock Setup
source $dir/dock.sh

# Setup Bottles
source $dir/bottles.sh
