#!/bin/bash

# shellcheck disable=SC1091
source ./functions.sh

## Dock settings
if [[ $(gsettings_get_dash_to_dock unity-backlit-items) == "true" ]]; then
  gsettings_set_dash_to_dock extend-height false
fi

if [[ $(gsettings_get_dash_to_dock dock-position) != "'BOTTOM'" ]]; then
  gsettings_set_dash_to_dock dock-position BOTTOM
fi

if [[ $(gsettings_get_dash_to_dock transparency-mode) != "'FIXED'" ]]; then
  gsettings_set_dash_to_dock transparency-mode FIXED
fi

if [[ $(gsettings_get_dash_to_dock dash-max-icon-size) != 64 ]]; then
  gsettings_set_dash_to_dock dash-max-icon-size 64
fi

if [[ $(gsettings_get_dash_to_dock unity-backlit-items) == "true" ]]; then
  gsettings_set_dash_to_dock unity-backlit-items false
fi

if [[ $(gsettings_get_dash_to_dock click-action) != "'minimize'" ]]; then
  gsettings_set_dash_to_dock click-action minimize
fi

if ! dconf list /org/gnome/terminal/legacy/profiles:/ | grep -q b1dcc9dd-5262-4d8d-a863-c897e6d979b9; then
  dconf load /org/gnome/terminal/legacy/profiles:/ < terminalProfiles.dconf
  dconf list /org/gnome/terminal/legacy/profiles:/
fi

if ! grep -q starship ~/.bashrc; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
  echo "eval \"$(starship init bash)\"" >> ~/.bashrc
fi