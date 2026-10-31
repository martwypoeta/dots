# Installing on a fresh mac

**1. Install nix** (the official one, not Determinate)

```bash
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh
```

**2. Clone**

```bash
mkdir -p ~/Code
git clone https://github.com/martwypoeta/dots.git ~/Code/dots
```

> [!TIP]
> Repo private? Make it public for a minute, clone, flip it back.

**3. First switch**

```bash
sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin/master#darwin-rebuild -- switch --flake ~/Code/dots#olek
```

Open a new terminal and you're in fish.

**4. gpg and github**

Plug in the usb stick, then:

```bash
gpg --import /Volumes/USB/martwypoeta-secret.asc
gh auth login
```

After that, see [Daily use](README.md#daily-use) in the README.
