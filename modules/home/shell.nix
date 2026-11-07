{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      # hide starship warnings like command timeouts, keep errors
      set -gx STARSHIP_LOG error
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
