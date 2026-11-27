{config, ...}: {
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleIconAppearanceTheme = "RegularDark";
      AppleWindowTabbingMode = "always";
      "com.apple.trackpad.forceClick" = true;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticInlinePredictionEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };

    dock = {
      tilesize = 64;
      magnification = false;
      show-recents = false;
      persistent-apps = [
        "/System/Cryptexes/App/System/Applications/Safari.app"
        "/Applications/Vesktop.app"
        "/Applications/Ghostty.app"
        "/System/Applications/Mail.app"
        "/System/Applications/Notes.app"
        "/Applications/Claude.app"
        "/System/Applications/Music.app"
        "/System/Applications/Messages.app"
        "/Applications/T3 Code (Beta).app"
      ];
      persistent-others = [];
      # hot corners: top left opens Launchpad (11), the rest are off (1)
      wvous-tl-corner = 11;
      wvous-tr-corner = 1;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
    };

    finder = {
      AppleShowAllFiles = true;
      # search the current folder, not the whole mac
      FXDefaultSearchScope = "SCcf";
      FXRemoveOldTrashItems = true;
      FXPreferredViewStyle = "icnv";
      NewWindowTarget = "Other";
      NewWindowTargetPath = "file://${config.users.users.${config.system.primaryUser}.home}/Downloads/";
    };

    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
    };

    menuExtraClock = {
      ShowAMPM = true;
      ShowDate = 1;
      ShowDayOfWeek = true;
    };
    screencapture.target = "clipboard";

    # keys with no first-class option
    CustomUserPreferences = {
      # 1 is orange (-1 graphite, 0 red, 2 yellow, 3 green, 4 blue, 5 purple, 6 pink)
      NSGlobalDomain.AppleAccentColor = 1;

      "com.apple.finder".ShowRecentTags = false;
      "com.apple.Music".userWantsPlaybackNotifications = false;

      "com.apple.screencapture" = {
        showsClicks = true;
        target-screenshot = "clipboard";
      };

      "com.apple.Safari" = {
        AlwaysRestoreSessionAtLaunch = true;
        ExcludePrivateWindowWhenRestoringSessionAtLaunch = true;
        ShowFullURLInSmartSearchField = true;
        AutoOpenSafeDownloads = false;
        # Safari ignores the NSGlobalDomain ones
        WebAutomaticSpellingCorrectionEnabled = false;
        WebAutomaticQuoteSubstitutionEnabled = false;
        WebAutomaticDashSubstitutionEnabled = false;
      };
    };
  };
}
