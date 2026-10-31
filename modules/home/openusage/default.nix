{
  lib,
  pkgs,
  ...
}: let
  domain = "com.robinebers.openusage";

  # unchecked in Customize
  hiddenMetrics = [
    "antigravity.claude"
    "antigravity.claudeWeekly"
    "claude.fable"
    "claude.extra"
  ];

  hideMetrics = pkgs.writeShellApplication {
    name = "openusage-hide-metrics";
    runtimeInputs = [pkgs.jq];
    text = builtins.readFile ./hide-metrics.sh;
  };
in {
  targets.darwin.defaults.${domain} = {
    meterStyle = "used";
    SUEnableAutomaticChecks = false;
    "openusage.enabledProviders.v1" = [
      "claude"
      "antigravity"
    ];
    # starred in Customize, at most 2 per provider
    "openusage.layout.v1.menuBarPins" = [
      "antigravity.geminiPro"
      "antigravity.geminiWeekly"
      "claude.session"
      "claude.weekly"
    ];
  };

  targets.darwin.defaults."${domain}.telemetry".enabled = false;

  home.activation.openusageHideMetrics = lib.hm.dag.entryAfter ["writeBoundary"] ''
    run ${lib.getExe hideMetrics} ${lib.escapeShellArg (builtins.toJSON hiddenMetrics)}
  '';
}
