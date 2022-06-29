#!/bin/bash

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

casks=(
  spotify
  brave-browser
  discord
  font-jetbrains-mono-nerd-font
  keepassxc
  macfuse
  whatsapp
  clipy
  alfred
)

function brew_func {
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
}

for dir in */; do
  echo "Stowing $dir"
  if [[ $dir == "nvim/" ]]; then
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    mkdir $HOME/.config/nvim/lua/custom
    stow -R -t $HOME/.config/nvim/lua/custom/ $dir
  else 
    stow -R -t $HOME/.config/$dir $dir
  fi
done

case "$1" in
  brew) brew_func
    ;;
  all) brew_func 
    ;;
  *) echo "use brew to install brew binaries or all to do everything."
    ;;
esac

