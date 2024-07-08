#!/bin/bash

## Dock settings
if [[ $(gsettings get org.gnome.shell.extensions.dash-to-dock unity-backlit-items) == "true" ]]; then
  gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
fi

if [[ $(gsettings get org.gnome.shell.extensions.dash-to-dock dock-position) != "'BOTTOM'" ]]; then
  gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
fi

if [[ $(gsettings get org.gnome.shell.extensions.dash-to-dock transparency-mode) != "'FIXED'" ]]; then
  gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
fi

if [[ $(gsettings get org.gnome.shell.extensions.dash-to-dock dash-max-icon-size) != 64 ]]; then
  gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
fi

if [[ $(gsettings get org.gnome.shell.extensions.dash-to-dock unity-backlit-items) == "true" ]]; then
  gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false
fi
