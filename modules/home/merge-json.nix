{
  config,
  lib,
  pkgs,
  ...
}: let
  files = config.home.mergeJson;
in {
  # for files the app writes to as well, where a linked file would break it
  options.home.mergeJson = lib.mkOption {
    type = lib.types.attrsOf lib.types.path;
    default = {};
    description = "JSON merged into files relative to the home directory on every switch. Declared keys win, the rest is kept.";
  };

  config.home.activation.mergeJson = lib.mkIf (files != {}) (
    lib.hm.dag.entryAfter ["writeBoundary"] ''
      mergeJson() {
        local target="$HOME/$1" current="$HOME/$1"
        [ -f "$target" ] || current=/dev/null
        local merged
        merged=$(${lib.getExe pkgs.jq} -s add "$current" "$2")
        run mkdir -p "$(dirname "$target")"
        run --quiet tee "$target" <<< "$merged"
      }
      ${lib.concatLines (lib.mapAttrsToList (target: source: "mergeJson ${lib.escapeShellArg target} ${source}") files)}
    ''
  );
}
