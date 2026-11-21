{
  imports = [
    ./claude-desktop
    ./firefox.nix
    ./ghostty.nix
    ./git.nix
    ./gpg
    ./merge-json.nix
    ./shell.nix
    ./vesktop
    ./vscode
  ];

  home.stateVersion = "25.11";
  home.sessionPath = ["$HOME/.local/bin"];
  # no "last login" line in new terminals
  home.file.".hushlogin".text = "";
}
