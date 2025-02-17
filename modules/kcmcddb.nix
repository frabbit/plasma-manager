{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.kcmcddb = { 
    "Lookup" = with types; mkOption {
      type = submodule {
        options = { 
          CacheLookupEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          FreedbLookupEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          FreedbLookupTransport = mkOption {
            type = nullOr (either str (enum [ 
              "CDDBP"
              "HTTP"
            ]));
            default = "HTTP";
            description = ''
              

              Type: Enum
              Choices: 
                - CDDBP
                - HTTP
            '';
          };
          MusicBrainzLookupEnabled = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          cacheLocations = mkOption {
            type = nullOr (either str (listOf str));
            default = ''QStringList(QDir::homePath()+QLatin1String("/.cddb/"))'';
            defaultText = "Code: true";
            description = ''
              

              Type: PathList
            '';
          };
          hostname = mkOption {
            type = nullOr str;
            default = "gnudb.gnudb.org";
            description = ''
              

              Type: String
            '';
          };
          port = mkOption {
            type = nullOr (either str int);
            default = 80;
            description = ''
              

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "Lookup";
    };    
    "Submit" = with types; mkOption {
      type = submodule {
        options = { 
          FreedbSubmitTransport = mkOption {
            type = nullOr (either str (enum [ 
              "HTTP"
              "SMTP"
            ]));
            default = "HTTP";
            description = ''
              

              Type: Enum
              Choices: 
                - HTTP
                - SMTP
            '';
          };
          emailAddress = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          httpSubmitPort = mkOption {
            type = nullOr (either str int);
            default = 80;
            description = ''
              

              Type: Int
            '';
          };
          httpSubmitServer = mkOption {
            type = nullOr str;
            default = "gnudb.gnudb.org";
            description = ''
              

              Type: String
            '';
          };
          replyTo = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          smtpHostname = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          smtpPort = mkOption {
            type = nullOr (either str int);
            default = 25;
            description = ''
              

              Type: Int
            '';
          };
          smtpUsername = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          submitAddress = mkOption {
            type = nullOr str;
            default = "gnudb-submit@gnudb.org";
            description = ''
              

              Type: String
            '';
          };
          useGlobalEmail = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Submit";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."kcmcddbrc" = cfg.kcmcddb;
  };
}
