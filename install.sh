#!/bin/bash
echo "Installing lunarvim"
git clone --depth 1 https://github.com/LunarVim/LunarVim.git $HOME/.config/nvim &

binaries=( 
  go 
  docker 
  docker-compose
  podman 
  neovim 
  terraform 
  awscli 
  bpytop 
  fzf 
  jq 
  yq
  kind 
  k9s 
  lazygit 
  kubernetes-cli 
  "python@3.10" 
  tealdeer 
  zplug 
  starship 
  neofetch
  helm
  gh
)

head_binaries=( colima )

casks=(
  spotify
  brave-browser
  goneovim
  discord
  font-jetbrains-mono-nerd-font
  kitty
  keepassxc
  macfuse
  whatsapp
  clipy
  alfred
)

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


echo "Fetching casks"
for cask in "${casks[@]}"; do
  echo "fetching $cask"
  brew fetch --cask $cask &
done

for job in $(jobs -p); do
  wait $job
done

echo "Installing Brew Binaries"
brew install $binaries

echo "Installing casks"
brew install --cask $casks

echo "Installing head binaries"
brew install --HEAD $head_binaries

echo "Installing pip packages"
pip install pynvim &

for dir in $(/bin/ls -d */); do
  echo "Stowing $dir"
  stow -t $HOME/.config/$dir $dir
done
