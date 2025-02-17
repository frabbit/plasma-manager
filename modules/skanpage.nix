{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.skanpage = { 
    "General" = with types; mkOption {
      type = submodule {
        options = { 
          defaultFolder = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: Url
            '';
          };
          defaultNameFilter = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          deviceModel = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          deviceName = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          deviceVendor = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          showAllDevices = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "General";
    };    
    "UiSettings" = with types; mkOption {
      type = submodule {
        options = { 
          exportHeight = mkOption {
            type = nullOr (either str int);
            default = "
      400
    ";
            description = ''
              

              Type: UInt
            '';
          };
          exportWidth = mkOption {
            type = nullOr (either str int);
            default = "
        600
    ";
            description = ''
              

              Type: UInt
            '';
          };
          height = mkOption {
            type = nullOr (either str int);
            default = "
        550
    ";
            description = ''
              

              Type: UInt
            '';
          };
          settingsHeight = mkOption {
            type = nullOr (either str int);
            default = "
        300
    ";
            description = ''
              

              Type: UInt
            '';
          };
          settingsWidth = mkOption {
            type = nullOr (either str int);
            default = "
        500
    ";
            description = ''
              

              Type: UInt
            '';
          };
          shareHeight = mkOption {
            type = nullOr (either str int);
            default = "
        400
    ";
            description = ''
              

              Type: UInt
            '';
          };
          shareWidth = mkOption {
            type = nullOr (either str int);
            default = "
        600
    ";
            description = ''
              

              Type: UInt
            '';
          };
          showAllOptions = mkOption {
            type = nullOr (either str bool);
            default = "
      false
    ";
            description = ''
              

              Type: Bool
            '';
          };
          showOptions = mkOption {
            type = nullOr (either str bool);
            default = "
      true
    ";
            description = ''
              

              Type: Bool
            '';
          };
          splitViewItemWidth = mkOption {
            type = nullOr (either str int);
            default = "
        300
    ";
            description = ''
              

              Type: UInt
            '';
          };
          width = mkOption {
            type = nullOr (either str int);
            default = "
        950
    ";
            description = ''
              

              Type: UInt
            '';
          };
          x = mkOption {
            type = nullOr (either str int);
            default = "
        0
    ";
            description = ''
              

              Type: UInt
            '';
          };
          y = mkOption {
            type = nullOr (either str int);
            default = "
        0
    ";
            description = ''
              

              Type: UInt
            '';
          };
        };
      };
      default = {};
      description = "UiSettings";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."skanpagerc" = cfg.skanpage;
  };
}
