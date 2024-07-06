# Miyuun Dot Files

## Compatibility

- **Arch Linux** (for installation scripts)

## Disclaimer

The primary focus of this repository is to store my dotfiles. I do not prioritize distributing my dotfiles. As a result, I do not thoroughly test the installation scripts and do not test the dotfiles on other distributions or desktop environments. They should work but might require some modification sometimes.

## Installation

Clone the repository:

```sh
git clone https://github.com/Miyunn/dotfiles.git ~/dotfiles
```

### Option 1: Standard Installation

Run `install.sh` in the dotfiles directory:

```sh
cd ~/dotfiles && ./install.sh

```

### Option 2: Fast Installation

Run the following command in your terminal:

```sh
cd ~/dotfiles && ./fast-install.sh
```

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

## Optional packages

- Chromium
- Discord
- Spotify (spotify-launcher)
- Spectacle
- Easy effects
- Linux studio plugins (lsp-plugins)

## Known issues

- When using the install script after zsh is installed the script will stop, work around is to re-run the script
- Installation script is not configured to install the plasma configs

## Updating

- To update the dotfiles you can run `git pull` in the dotfiles directorw
- To update the packages you can run `yay -Syu` or `sudo pacman -Syu`
