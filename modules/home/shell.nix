{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    presets = ["no-nerd-font"];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  home.shellAliases.cd = "z";
}
