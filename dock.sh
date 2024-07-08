#!/bin/bash

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
