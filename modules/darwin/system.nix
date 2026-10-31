{
  config,
  inputs,
  pkgs,
  ...
}: let
  user = config.system.primaryUser;
in {
  system.stateVersion = 5;
  system.primaryUser = "olek";

  users.knownUsers = [user];
  users.users.${user} = {
    home = "/Users/${user}";
    uid = 501;
    shell = pkgs.fish;
  };

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  programs.fish.enable = true;
  environment.shells = [pkgs.fish];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user} = import ../home;
  };

  nixpkgs.config.allowUnfree = true;
  # nixpkgs lags behind claude code releases, this overlay follows them within hours
  nixpkgs.overlays = [inputs.claude-code.overlays.default];

  environment.systemPackages = [
    pkgs.fastfetch
    pkgs.nodejs_24
    pkgs.pnpm
    pkgs.uv
  ];

  fonts.packages = [./fonts/InputMono-Regular.ttf];
}
