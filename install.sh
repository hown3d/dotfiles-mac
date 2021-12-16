#!/bin/bash

for dir in $(/bin/ls -d */); do
  echo "Stowing $dir"
  stow -t $HOME/.config/$dir $dir
done
