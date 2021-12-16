#!/bin/bash
echo "Installing lunarvim"
git clone --depth 1 https://github.com/LunarVim/LunarVim.git $HOME/.config/nvim &

binaries=( go docker podman neovim )
head_binaries=( colima )

echo "Fetching binaries"
for binary in "${binaries[@]}"; do
  echo "fetching $binary"
  brew fetch $binary &
done

echo "Fetching head binaries"
for binary in "${head_binaries[@]}"; do
  echo "fetching $binary"
  brew fetch $binary &
done

for job in $(jobs -p); do
  wait $job
done

echo "Installing Brew Binaries"
brew install $binaries

echo "Installing casks"
brew install --cask goneovim 

echo "Installing head binaries"
brew install --HEAD $head_binaries

echo "Installing pip packages"
pip install pynvim &

for dir in $(/bin/ls -d */); do
  echo "Stowing $dir"
  stow -t $HOME/.config/$dir $dir
done
