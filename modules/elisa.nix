{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.elisa = { 
    "ElisaFileIndexer" = with types; mkOption {
      type = submodule {
        options = { 
          ForceUsageOfFastFileSearch = mkOption {
            type = nullOr (either str bool);
            default = "";
            description = ''
              

              Type: Bool
            '';
          };
          RootPath = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: PathList
            '';
          };
        };
      };
      default = {};
      description = "ElisaFileIndexer";
    };    
    "PlayerSettings" = with types; mkOption {
      type = submodule {
        options = { 
          PlayAtStartup = mkOption {
            type = nullOr (either str bool);
            default = "
      false
    ";
            description = ''
              

              Type: Bool
            '';
          };
          ScanAtStartup = mkOption {
            type = nullOr (either str bool);
            default = "
      true
    ";
            description = ''
              

              Type: Bool
            '';
          };
          ShowNowPlayingBackground = mkOption {
            type = nullOr (either str bool);
            default = "
         true
     ";
            description = ''
              

              Type: Bool
            '';
          };
          ShowProgressOnTaskBar = mkOption {
            type = nullOr (either str bool);
            default = "
      true
    ";
            description = ''
              

              Type: Bool
            '';
          };
          ShowSystemTrayIcon = mkOption {
            type = nullOr (either str bool);
            default = "
      false
    ";
            description = ''
              

              Type: Bool
            '';
          };
          UseFavoriteStyleRatings = mkOption {
            type = nullOr (either str bool);
            default = "
      false
    ";
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "PlayerSettings";
    };    
    "Playlist" = with types; mkOption {
      type = submodule {
        options = { 
          AlwaysUseAbsolutePlaylistPaths = mkOption {
            type = nullOr (either str bool);
            default = "
     false
   ";
            description = ''
              

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "Playlist";
    };    
    "Views" = with types; mkOption {
      type = submodule {
        options = { 
          ColorScheme = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              

              Type: String
            '';
          };
          EmbeddedView = mkOption {
            type = nullOr (either str (enum [ 
              "NoView"
              "AllAlbums"
              "AllArtists"
              "AllGenres"
            ]));
            default = "";
            description = ''
              

              Type: Enum
              Choices: 
                - NoView
                - AllAlbums
                - AllArtists
                - AllGenres
            '';
          };
          InitialView = mkOption {
            type = nullOr (either str (enum [ 
              "ContextView"
              "RecentlyPlayed"
              "FrequentlyPlayed"
              "AllAlbums"
              "AllArtists"
              "AllTracks"
              "AllGenres"
              "Files"
              "Radios"
            ]));
            default = "";
            description = ''
              

              Type: Enum
              Choices: 
                - ContextView
                - RecentlyPlayed
                - FrequentlyPlayed
                - AllAlbums
                - AllArtists
                - AllTracks
                - AllGenres
                - Files
                - Radios
            '';
          };
          SortOrderPreferences = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
          SortRolePreferences = mkOption {
            type = nullOr (either str (listOf str));
            default = "";
            description = ''
              

              Type: StringList
            '';
          };
        };
      };
      default = {};
      description = "Views";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."elisarc" = cfg.elisa;
  };
}
