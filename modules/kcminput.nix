{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kcminput = { 
    "Keyboard" = with types; mkOption {
      type = submodule {
        options = { 
          KeyRepeat = mkOption {
            type = nullOr str;
            default = null;
            defaultText = "Code: true";
            description = ''
              

              Type: String
            '';
          };
          NumLock = mkOption {
            type = nullOr (either str int);
            default = 2;
            description = ''
              

              Type: Int
            '';
          };
          RepeatDelay = mkOption {
            type = nullOr (either str int);
            default = 600;
            description = ''
              

              Type: Int
              Min: 100
              Max: 5000
            '';
          };
          RepeatRate = mkOption {
            type = nullOr (either str float);
            default = 25.0;
            description = ''
              

              Type: Double
              Min: 0.2
              Max: 100
            '';
          };
        };
      };
      default = {};
      description = "Keyboard";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kcminputrc" = cfg.kcminput;
  };
}
