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

<details>
<summary>Arch Linux (<code>pacman, paru</code>)</summary>

```bash
pacman -S --needed \
  hyprland git zsh kitty \
  nano bat tree

paru -S --needed \
  hyprshot
```

</details>

### (Optional) Post-install

#### zsh

Change current user shell to zsh.

```bash
chsh -s $(which zsh)
```
