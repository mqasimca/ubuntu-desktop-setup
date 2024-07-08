#!/bin/bash

dir=$(pwd)
source ./functions.sh

# APT packages
sudo -s source $dir/apt.sh

# Flatpak packages
sudo -s source $dir/flatpak.sh

# Dock Setup
source $dir/dock.sh

# Setup Bottles
source $dir/bottles.sh