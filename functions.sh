#!/bin/bash

reboot_required () {
  if [ -f /var/run/reboot-required ]; then
    echo 'reboot required'
    exit 1
  else
    echo 'reboot not required'
  fi
}

apt () {
  apt-get -qq "$@"
}

apt_assume_yes () {
  apt -y "$@"
}

apt_install () {
  apt_assume_yes install "$@"
}

install_flatpak () {
  flatpak install -y --noninteractive "$@"
}

gsettings_get_dash_to_dock () {
  gsettings get org.gnome.shell.extensions.dash-to-dock "$@"
}

gsettings_set_dash_to_dock () {
  gsettings set org.gnome.shell.extensions.dash-to-dock "$@"
}