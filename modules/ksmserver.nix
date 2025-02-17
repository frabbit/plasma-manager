{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.ksmserver = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          confirmLogout = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Confirm logout

              Type: Bool
            '';
          };
          excludeApps = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              Applications to be excluded from session

              Type: String
            '';
          };
          loginMode = mkOption {
            type = nullOr (either str (enum [ 
              "restorePreviousLogout"
              "restoreSavedSession"
              "emptySession"
            ]));
            default = "restorePreviousLogout";
            description = ''
              On login

              Type: Enum
              Choices: 
                - restorePreviousLogout
                - restoreSavedSession
                - emptySession
            '';
          };
          shutdownType = mkOption {
            type = nullOr (either str int);
            default = 0;
            description = ''
              Default leave option

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."ksmserverrc" = cfg.ksmserver;
  };
}
