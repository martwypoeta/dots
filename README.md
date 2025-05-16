# martwypoeta/dots

My personal Arch Linux dotfiles.

> [!NOTE]
> These dotfiles are provided as-is, without any warranty. Use at your own risk. I am not responsible for any damage or data loss resulting from their use.

## Overview

Those dotfiles are made specifically for this environment:

- OS: Arch Linux
- Wayland compositor: [`Hyprland`](https://github.com/hyprwm/Hyprland)
- Shell: [`zsh`](https://github.com/zsh-users/zsh)
- Terminal emulator: [`kitty`](https://github.com/kovidgoyal/kitty)

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/martwypoeta/dots.git ~/.arch
cd ~/.arch
```

### 2. Link Dotfiles

This repo uses a linking script and a [`symlinks.map`](./symlinks.map) file to manage dotfile symlinks.

```bash
chmod +x _scripts/link.sh
./_scripts/link.sh
```

### 3. Install Dependencies (Arch-based systems)

Use `pacman` for base packages:

```bash
pacman -S --needed hyprland git zsh kitty bat tree
```

Use `paru` for AUR packages:

```bash
paru -S --needed hyprshot
```
