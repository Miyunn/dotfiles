#!/bin/bash

# Install Plasma
echo "Installing plasma..."
sudo pacman -S plasma

# Install required packages
echo "Installing required packages..."
sudo pacman -Syu neovim neofetch alacritty zsh git ttf-jetbrains-mono-nerd noto-fonts-cjk wl-clipboard dolphin ripgrep|| {
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
echo "Install Neovim configs (Recommended)?"
read -r -p "(Y/n) " install_neovim

if [[ $install_neovim =~ ^[Yy]$ ]]; then
echo "Installing Neovim configuration..."
cp -r neovim ~/.config || {
  echo "Error: Failed to copy Neovim configuration."
}
else
  echo "skipping installing Neovim configurations"
fi

# ZSH configuration
echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || {
  echo "Failed to install oh my zsh"
}

cp ohmyzsh/.zshrc ~

#set hardware clock as standard local time
echo "Setting hardware clock as standard local time"
timedatectl set-local-rtc 1

#Removing unwanted packages
sudo pamcan -R discover

#Reboot prompt
echo "Installation completed!"
echo "Reboot system for settings to take effect"

if [[ $install_nvchad =~ ^[Yy]$ ]]; then
  reboot 
read -r -p "(Y/n) " install_nvchad
fi

#completed
