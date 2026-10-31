# My dotfiles

<details>
<summary>don't read!</summary>
<br>
✓ one command and the whole mac is back
<br>
✓ declarative, nothing installed by hand
<br>
✓ boring on purpose
</details>
<br>

**OS:** macOS (Apple Silicon), managed with [nix-darwin](https://github.com/nix-darwin/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager)

**Nix:** the official one with flakes, not Determinate

**Editor:** [VS Code](#editor)

**Terminal:** [Ghostty](https://ghostty.org/) ([config](modules/home/ghostty.nix))

**Shell:** [fish](https://fishshell.com/) ([config](modules/home/shell.nix))

## Layout

- [`flake.nix`](flake.nix): inputs and wiring, nothing else
- [`modules/darwin`](modules/darwin): the system side
  - [`system.nix`](modules/darwin/system.nix): user, nix settings, shell, packages, fonts
  - [`defaults.nix`](modules/darwin/defaults.nix): macOS preferences
  - [`homebrew.nix`](modules/darwin/homebrew.nix): casks, brews, App Store apps, VS Code extensions
- [`modules/home`](modules/home): the user side, one module per app. Apps with their own config files get a directory, with the files next to its `default.nix`

GUI apps are Homebrew casks, CLI tools come from nixpkgs, never both. Homebrew is handled by [nix-homebrew](https://github.com/zhaofengli/nix-homebrew) with the taps pinned in `flake.lock`, so apps only move when the flake does.

## Terminal

- [Ghostty](https://ghostty.org/) ([config](modules/home/ghostty.nix))
- [fish](https://fishshell.com/) ([config](modules/home/shell.nix))
- [Starship](https://starship.rs/), no nerd font needed
- [zoxide](https://github.com/ajeetdsouza/zoxide), `cd` is aliased to `z`
- [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Claude Code](https://github.com/anthropics/claude-code) from [claude-code-nix](https://github.com/sadjow/claude-code-nix) ([config](modules/home/claude-code))
- [git](modules/home/git.nix) and [gpg](modules/home/gpg) with pinentry-mac
- node 24, pnpm and uv for JavaScript and Python

## Editor

[VS Code](https://code.visualstudio.com/) ([config](modules/home/vscode)). Settings are linked from the repo, extensions come from the Marketplace through Homebrew.

- Theme: [Vitesse Dark Soft](https://marketplace.visualstudio.com/items?itemName=antfu.theme-vitesse)
- Icons: [Catppuccin Icons](https://marketplace.visualstudio.com/items?itemName=Catppuccin.catppuccin-vsc-icons)
- Font: Input Mono (see [Font license](#font-license))

<details>
<summary>all extensions (click)</summary>

- [Nix IDE](https://marketplace.visualstudio.com/items?itemName=jnoortheen.nix-ide)
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python), Pylance, Debugpy and Python Environments
- [Astro](https://marketplace.visualstudio.com/items?itemName=astro-build.astro-vscode)
- [Vue (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.volar)
- [Color Highlight](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight)
- [CodeSnap](https://marketplace.visualstudio.com/items?itemName=adpyke.codesnap)
- Open in GitHub, two flavours

</details>

## Apps

| app | what it's for | via |
| :-- | :-- | :-: |
| **Ghostty** ([config](modules/home/ghostty.nix)) | Terminal emulator | cask |
| **VS Code** ([config](modules/home/vscode)) | Code editor | cask |
| **Zen** ([config](modules/home/zen.nix)) | Web browser with iCloud Passwords | cask |
| **Claude** | Desktop client for Claude | cask |
| **OpenUsage** ([config](modules/home/openusage)) | AI usage limits in the menu bar | cask |
| **Vesktop** ([config](modules/home/vesktop)) | Discord client based on Vencord | cask |
| **Spotify** | Music streaming | cask |
| **Termius** | SSH client | App Store |
| **gh** | GitHub command line interface | brew |
| **mole** | System cleanup utility | brew |
| **pinentry-mac** | Passphrase prompt for GPG | brew |

The wallpaper is set on every switch ([config](modules/home/wallpaper)).

## Installing

Setting up a fresh mac is four steps, see [INSTALL.md](INSTALL.md).

## Daily use

| what | command |
| :-- | :-- |
| rebuild | `sudo darwin-rebuild switch --flake ~/Code/dots#olek` |
| update everything | `nix flake update --flake ~/Code/dots`, then rebuild |
| format | `cd ~/Code/dots && nix fmt .` |
| clean up | `sudo nix-collect-garbage -d` |

`nix fmt .` runs [alejandra](https://github.com/kamadorueda/alejandra), the formatter set in the flake, over every `.nix` file.

> [!NOTE]
> In-app updaters are off wherever possible. Updates go through the flake, so nixpkgs, formulae and casks all bump together on the next rebuild.

> [!WARNING]
> Homebrew cleanup is set to `zap`: a rebuild uninstalls anything not listed in `homebrew.nix`, app data included. Never `brew install` by hand.

## License

The config is [MIT](LICENSE), except for the font below.

### Font license

[`InputMono-Regular.ttf`](modules/darwin/fonts/InputMono-Regular.ttf) is [Input](https://input.djr.com/) by David Jonathan Ross and The Font Bureau. I downloaded it from their website for personal use. It is **not** covered by the MIT license and it is not free for commercial use. If you want to use it, get your own copy and read their [license](https://input.djr.com/license) first.

## Disclaimer

This setup is very specific to me (my name, my machine, my keys), so it probably won't work for you as is. Take whatever is useful, but read before you switch.
