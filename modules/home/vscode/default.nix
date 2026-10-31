{
  programs.vscode = {
    enable = true;
    # installed and updated by homebrew, extensions too (homebrew.vscode)
    package = null;
    mutableExtensionsDir = true;

    profiles.default = {
      userSettings = ./settings.json;
      # stays writable, declared keys win again on every switch
      mutableUserSettings = true;
    };
  };
}
