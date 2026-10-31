{
  programs.git = {
    enable = true;
    # macOS ships git
    package = null;
    # signing.signByDefault = true;

    settings = {
      user.name = "martwypoeta";
      user.email = "269540815+martwypoeta@users.noreply.github.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      checkout.defaultRemote = "origin";
    };
  };

  # gh is updated by homebrew
  home.sessionVariables.GH_NO_UPDATE_NOTIFIER = "1";
}
