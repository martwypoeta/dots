{
  config,
  inputs,
  ...
}: {
  # taps come from flake inputs, so brew only moves when flake.lock does
  nix-homebrew = {
    enable = true;
    # brew from our own brew-src input, the version is the tag it's pinned to in flake.lock
    package = let
      lock = builtins.fromJSON (builtins.readFile ../../flake.lock);
      version = lock.nodes.${lock.nodes.root.inputs.brew-src}.original.ref;
    in
      inputs.brew-src
      // {
        name = "brew-${version}";
        inherit version;
      };
    user = config.system.primaryUser;
    autoMigrate = true;
    mutableTaps = false;
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
  };

  homebrew = {
    enable = true;
    enableFishIntegration = true;
    taps = builtins.attrNames config.nix-homebrew.taps;
    # also upgrade casks that normally update themselves
    greedyCasks = true;
    onActivation = {
      # uninstalls anything not listed here, app data included
      cleanup = "zap";
      upgrade = true;
    };

    casks = [
      "claude"
      "ghostty"
      "roblox"
      "spotify"
      "vesktop"
      "visual-studio-code"
      "zen"
    ];

    brews = [
      "gh"
      "mole"
      "pinentry-mac"
    ];

    masApps = {
      Termius = 1176074088;
      Xcode = 497799835;
      "uBlock Origin Lite" = 6745342698;
    };
  };

  # runs after homebrew, so a fresh Xcode from the App Store is picked up in the same switch
  system.activationScripts.postActivation.text = ''
    xcode=/Applications/Xcode.app/Contents/Developer
    if [ -d "$xcode" ] && [ "$(xcode-select -p)" != "$xcode" ]; then
      echo >&2 "selecting Xcode..."
      xcode-select -s "$xcode"
    fi
  '';
}
