{
  # the app keeps only non-default keys in it and rewrites it on every change.
  # defaultTheme is applied once per defaultThemeSetAt, so bump that to apply it again
  home.mergeJson.".t3/userdata/settings.json" = ./settings.json;
  home.mergeJson.".t3/userdata/client-settings.json" = ./client-settings.json;
  # Graphite from t3themes.com, the app rewrites theme files when one is published again
  home.mergeJson.".t3/userdata/themes/graphite.json" = ./themes/graphite.json;
}
