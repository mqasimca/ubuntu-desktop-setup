#!/bin/bash

source ./functions.sh

if ! [[ $(flatpak list | grep bottles) ]]; then
  install_flatpak com.usebottles.bottles 
fi
