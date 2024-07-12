#!/bin/bash

source ./functions.sh

if ! [[ $(flatpak list | grep -i bottles) ]]; then
  install_flatpak com.usebottles.bottles 
fi

if ! [[ $(flatpak list | grep -i ProtonUp-Qt) ]]; then
  install_flatpak flathub net.davidotek.pupgui2
fi

if ! [[ $(flatpak list | grep -i protontricks) ]]; then
  install_flatpak flathub com.github.Matoking.protontricks
fi

if ! [[ $(flatpak list | grep -i Discord) ]]; then
  install_flatpak flathub com.discordapp.Discord
fi

if ! [[ $(flatpak list | grep -i zoom) ]]; then
  install_flatpak flathub us.zoom.Zoom
fi