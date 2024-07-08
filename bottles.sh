#!/bin/bash

b_name="Games"

b_cli () {
  flatpak run --command=bottles-cli com.usebottles.bottles "$@"
}

b_cli list bottles -f environment:gaming | grep $b_name
status=$?

if [[ $status != 0 ]]; then
  b_cli new --bottle-name $b_name --environment gaming
fi
