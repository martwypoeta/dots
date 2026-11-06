{
  imports = [
    ./claude-code
    ./ghostty.nix
    ./git.nix
    ./gpg
    ./merge-json.nix
    ./openusage
    ./shell.nix
    ./vesktop
    ./vscode
    ./wallpaper
    ./zen.nix
  ];

  home.stateVersion = "25.11";
  home.sessionPath = ["$HOME/.local/bin"];
  # no "last login" line in new terminals
  home.file.".hushlogin".text = "";
}
