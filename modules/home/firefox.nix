let
  locked = value: {
    Value = value;
    Status = "locked";
  };

  # takes the slug from the addons.mozilla.org url, pins the icon to the toolbar
  extension = slug: {
    install_url = "https://addons.mozilla.org/firefox/downloads/latest/${slug}/latest.xpi";
    installation_mode = "force_installed";
    default_area = "navbar";
  };

  uboDefaultLists = [
    "user-filters"
    "ublock-filters"
    "ublock-badware"
    "ublock-privacy"
    "ublock-abuse"
    "ublock-unbreak"
    "easylist"
    "easyprivacy"
    "urlhaus-1"
    "plowe-0"
  ];
in {
  targets.darwin.defaults."org.mozilla.firefox" = {
    EnterprisePoliciesEnabled = true;

    # homebrew does the updating
    DisableAppUpdate = true;

    DisableTelemetry = true;
    DisableFirefoxStudies = true;
    DisableRemoteImprovements = true;

    DontCheckDefaultBrowser = true;

    # icloud passwords handles passwords
    PasswordManagerEnabled = false;
    OfferToSaveLogins = false;
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;

    Preferences = {
      "browser.aboutConfig.showWarning" = locked false;
      "browser.warnOnQuitShortcut" = locked false;
      "signon.autofillForms" = locked false;
      "signon.generation.enabled" = locked false;

      # new tab wallpaper, value is the title from mozilla's newtab-wallpapers-v2 remote settings
      "browser.newtabpage.activity-stream.newtabWallpapers.enabled" = locked true;
      "browser.newtabpage.activity-stream.newtabWallpapers.user.enabled" = locked true;
      "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper" = locked "suspension-bridge";
    };

    ExtensionSettings = {
      "uBlock0@raymondhill.net" = extension "ublock-origin";
      "password-manager-firefox-extension@apple.com" = extension "icloud-passwords";
    };

    "3rdparty".Extensions."uBlock0@raymondhill.net" = {
      # replaces the whole selection on every launch, ids from ubo assets.json
      toOverwrite.filterLists =
        uboDefaultLists
        ++ [
          # cookie notices
          "fanboy-cookiemonster"
          "ublock-cookies-easylist"
          "adguard-cookies"
          "ublock-cookies-adguard"
        ];
    };
  };
}
