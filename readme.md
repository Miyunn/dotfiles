# Miyuun Dot Files

## Compatibility

- **Arch Linux** (for installation scripts)

## Disclaimer

The primary focus of this repository is to store my dotfiles. I do not prioritize distributing my dotfiles. As a result, I do not thoroughly test the installation scripts and do not test the dotfiles on other distributions or desktop environments. They should work but might require some modifications.

## Installation

Clone the repository:

```sh
git clone https://github.com/Miyunn/dotfiles.git ~/dotfiles
```

### Option 1: Quick install

This option bascially rapidly installs all the packages I use and symlink the configs with gnu-stow

Run `install.sh` in the dotfiles directory:

```sh
cd ~/dotfiles && ./install.sh

```

### Option 2: Custom install (outdated script)

This allows you to pick and choose certain packages and customization options

Run the following command in your terminal:
```sh
cd ~/dotfiles && ./custom-install.sh
```

### Option 3 : The good old way

Just copy or move the configs to the .config directory :> 

## Main packages

- Alacritty (terminal emulator)
- KDE Plasma (desktop environment)
- neovim
- neofetch
- noto-fonts-cjk
- tff-jetbrains-mono-nerd
- Ripgrep
- Stow (symlink manager)
- wl-clipboard
- Yay (AUR helper)
- Tmux
- zip and unzip
- zsh(Oh My Zsh)

## Other packages

- Chromium
- Discord
- Spotify (spotify-launcher)
- Spectacle
- Easy effects
- Linux studio plugins (lsp-plugins)

## Updating

- To update the dotfiles you can run `git pull` in the dotfiles directory
- To update the packages you can run `yay -Syu` or `sudo pacman -Syu`
