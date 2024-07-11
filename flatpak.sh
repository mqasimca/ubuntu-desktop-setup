#!/bin/bash

source ./functions.sh

if ! [[ $(flatpak list | grep -i bottles) ]]; then
  install_flatpak com.usebottles.bottles 
fi

if ! [[ $(flatpak list | grep -i ProtonUp-Qt) ]]; then
  install_flatpak flathub net.davidotek.pupgui2
fi

if ! [[ $(flatpak list | grep -i visualstudio | grep -i code) ]]; then
  install_flatpak flathub com.visualstudio.code
fi

if ! [[ $(flatpak list | grep -i microsoft | grep -i edge) ]]; then
  install_flatpak flathub com.microsoft.Edge
fi

if ! [[ $(flatpak list | grep -i valvesoftware | grep -i Steam) ]]; then
  install_flatpak flathub com.valvesoftware.Steam
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