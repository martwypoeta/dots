# martwypoeta/dots

My personal Arch Linux dotfiles.

> [!NOTE]
> Those dotfiles are made specifically for Arch Linux, but most of configuration files will probably work on other distros. With enough time and free will you can make it work on any distro you'd like.

## Installation

### Clone Repo

```bash
git clone https://github.com/martwypoeta/dots.git ~/.arch
cd ~/.arch
```

### Run Script

Make the linking script executable, and run it. This script will create symbolic links where needed. (You can find all in `symlinks.map` file)

```bash
chmod +x ./arch-link.sh
./arch-link.sh
```

### Install Dependencies

Install all of the required dependencies with your favourite package manager.

#### pacman

```bash
pacman -S --needed fastfetch git hyprland nano bat tree zsh
```

Done! You can now play with your system until it breaks (near future).
