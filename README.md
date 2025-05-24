# martwypoeta/dotfiles

![Arch](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=arch-linux&logoColor=fff) ![Hyprland](https://img.shields.io/badge/Hyprland-67e8f9?logo=hyprland&logoColor=000) ![Zsh](https://img.shields.io/badge/Zsh-F15A24?logo=zsh&logoColor=fff)

My personal Arch Linux dotfiles. Now managed with [chezmoi](https://chezmoi.io/)

> [!NOTE]
> These dotfiles are provided as-is, without any warranty. Use at your own risk. I am not responsible for any damage or data loss resulting from their use.

## Features

### Package Managers & Packages

- `Color`, `ILoveCandy` and `VerbosePkgLists` enabled in pacman configuration.

  ```diff
  @@ -1,6 +1,7 @@
  -#Color
  +Color
  +ILoveCandy
  #NoProgressBar
  CheckSpace
  -#VerbosePkgLists
  +VerbosePkgLists
  ```
- [paru](https://github.com/Morganamilo/paru) AUR helper.
- Automated package installation. [[packages.yaml](./.chezmoidata/packages.yaml)]

### Misc

- [PipeWire](https://github.com/PipeWire) for audio support.
  - Including `pipewire`, `pipewire-pulse`, `pipewire-alsa`, `pipewire-jack`, `wireplumber` and `rtkit`
- [Noto Fonts](https://fonts.google.com/noto) suite for multilingual and emoji support.
- [Iosevka](https://github.com/be5invis/Iosevka) as primary monospace font.
