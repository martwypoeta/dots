{
  lib,
  pkgs,
  ...
}: let
  # from the Marketplace, VS Code keeps them updated
  extensions = [
    "adpyke.codesnap"
    "antfu.open-in-github-button"
    "antfu.theme-vitesse"
    "astro-build.astro-vscode"
    "catppuccin.catppuccin-vsc-icons"
    "fabiospampinato.vscode-open-in-github"
    "jnoortheen.nix-ide"
    "ms-python.debugpy"
    "ms-python.python"
    "ms-python.vscode-pylance"
    "ms-python.vscode-python-envs"
    "naumovs.color-highlight"
    "vue.volar"
  ];

  syncExtensions = pkgs.writeShellApplication {
    name = "vscode-extensions";
    text = builtins.readFile ./extensions.sh;
  };
in {
  programs.vscode = {
    enable = true;
    # installed and updated by homebrew
    package = null;
    mutableExtensionsDir = true;

    profiles.default = {
      userSettings = ./settings.json;
      # stays writable, declared keys win again on every switch
      mutableUserSettings = true;
    };
  };

  home.activation.vscodeExtensions = lib.hm.dag.entryAfter ["writeBoundary"] ''
    run ${lib.getExe syncExtensions} ${lib.escapeShellArgs extensions}
  '';
}
