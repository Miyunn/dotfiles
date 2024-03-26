#!/bin/bash

# Install required packages
echo "Installing required packages..."
sudo pacman -Syu neovim neofetch alacritty zsh git ttf-jetbrains-mono-nerd noto-fonts-cjk || {
  echo "Error: Package installation failed. Please check your network connection or package repositories."
  exit 1
}

# Alacritty configuration
echo "Installing Alacritty configuration..."
cp -r alacritty ~/.config || {
  echo "Error: Failed to copy Alacritty configuration."
}

# Neofetch configuration
echo "Installing Neofetch configuration..."
cp -r neofetch ~/.config || {
  echo "Error: Failed to copy Neofetch configuration."
}

# Neovim configuration prompt (Y/N)
echo "Install Default NVChad configuration (Recommended)?"
read -r -p "(Y/n) " install_nvchad

if [[ $install_nvchad =~ ^[Yy]$ ]]; then
  echo "Installing NVChad..."
  git clone https://github.com/NvChad/starter ~/.config/nvim || {
    echo "Error: Failed to clone NVChad configuration."
    exit 1
  }
else
  echo "skipping installing Neovim configurations"
fi



echo "Installation complete!"

