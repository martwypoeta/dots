{
  # the app keeps only non-default keys in it and rewrites it on every change.
  # defaultTheme is applied once per defaultThemeSetAt, so bump that to apply it again
  home.mergeJson.".t3/userdata/settings.json" = ./settings.json;
}
