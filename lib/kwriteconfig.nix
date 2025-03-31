{ pkgs, lib }:

let

  ##############################################################################
  # Convert a Nix value into a command line argument to kwriteconfig.
  toKdeValue = with builtins;
    v:
    if v == null then
      "--delete"
    else if isString v then
      if v == "-1" then
        "-- -1"
      else if v == "--" then
        "-- --"
      else
        lib.escapeShellArg v
    else if isBool v then
      "--type bool " + lib.boolToString v
    else if isInt v && v < 0 then
      "-- ${toString v}"
    else if isInt v then
      toString v
    else if isFloat v && v < 0 then
      "-- ${toString v}"
    else if isFloat v then
      toString v
    else if isList v then
      concatStringsSep "," (map toString v)
    #else if isEnum v then
    #  toString v
    else
      abort ("Unknown value type: " ++ toString v);

  ##############################################################################
  # Generate a series of shell commands that will update a
  # configuration value.
  #
  # The given file name should be relative to XDG_CONFIG_HOME.
  #
  # The group names are used to generate a nested path to the group
  # containing the settings in the attribute set.
  #
  # The attribute set is the settings and values to set.
  #
  # Type: string -> [string] -> AttrSet -> string
  kWriteConfig = file: group: attrs:
    lib.concatStringsSep "\n" (lib.mapAttrsToList (key: value: 
      let 
        debugCommand = ''
          #set -x
          echo "$(cat <<'EOF'
          ###### Setting key=${lib.escapeShellArg key}=${toKdeValue value} in group=${lib.escapeShellArg group} for file=${lib.escapeShellArg file}
          EOF
          )"
          '';
        debugAll = false;
        ifDebugAll = x: if debugAll then x else "";
      in
      ''
        ${ifDebugAll debugCommand}
        ${pkgs.libsForQt5.kconfig}/bin/kwriteconfig5 \
          --file ''${XDG_CONFIG_HOME:-$HOME/.config}/${lib.escapeShellArg file} \
          --group ${lib.escapeShellArg group} \
          --key ${lib.escapeShellArg key} \
          ${toKdeValue value}
        if [ $? -ne 0 ]; then
          ${debugCommand}
        fi
      '') attrs);
in { inherit kWriteConfig; }
