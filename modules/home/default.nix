{
  imports = [
    ./claude-desktop
    ./ghostty.nix
    ./git.nix
    ./gpg
    ./merge-json.nix
    ./shell.nix
    ./vesktop
    ./vscode
    ./zen.nix
  ];

  home.stateVersion = "25.11";
  home.sessionPath = ["$HOME/.local/bin"];
  # no "last login" line in new terminals
  home.file.".hushlogin".text = "";
}
