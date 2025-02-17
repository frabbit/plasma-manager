{ config, lib, ... }:
with lib;
let cfg = config.programs.plasma;
in {
  options.programs.plasma.konsole = { 
    "FileLocation" = with types; mkOption {
      type = submodule {
        options = { 
          scrollbackUseCacheLocation = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              For scrollback files, use user's specific folder location

              Type: Bool
            '';
          };
          scrollbackUseSpecifiedLocation = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              For scrollback files, use specified folder location

              Type: Bool
            '';
          };
          scrollbackUseSpecifiedLocationDirectory = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              For scrollback files, use this folder

              Type: Url
            '';
          };
          scrollbackUseSystemLocation = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              For scrollback files, use system-wide folder location

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "FileLocation";
    };    
    "KonsoleWindow" = with types; mkOption {
      type = submodule {
        options = { 
          AllowMenuAccelerators = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Enable menu accelerators

              Type: Bool
            '';
          };
          FocusFollowsMouse = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Focus terminals when the mouse pointer is moved over them

              Type: Bool
            '';
          };
          RememberWindowSize = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Use current window size on next startup

              Type: Bool
            '';
          };
          RemoveWindowTitleBarAndFrame = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Remove window titlebar and frame

              Type: Bool
            '';
          };
          ShowWindowTitleOnTitleBar = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Show window title on the titlebar

              Type: Bool
            '';
          };
          UseSingleInstance = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Run all Konsole windows in a single process

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "KonsoleWindow";
    };    
    "PrintOptions" = with types; mkOption {
      type = submodule {
        options = { 
          PrinterFriendly = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Printer &friendly mode (black text, no background)

              Type: Bool
            '';
          };
          ScaleOutput = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              &Scale output

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "PrintOptions";
    };    
    "SearchSettings" = with types; mkOption {
      type = submodule {
        options = { 
          SearchCaseSensitive = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Search is case sensitive

              Type: Bool
            '';
          };
          SearchHighlightMatches = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Highlight all search matches

              Type: Bool
            '';
          };
          SearchRegExpression = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Match using regular expressions

              Type: Bool
            '';
          };
          SearchReverseSearch = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              Search backwards

              Type: Bool
            '';
          };
        };
      };
      default = {};
      description = "SearchSettings";
    };    
    "SplitView" = with types; mkOption {
      type = submodule {
        options = { 
          SplitDragHandleSize = mkOption {
            type = nullOr (either str (enum [ 
              "SplitDragHandleSmall"
              "SplitDragHandleMedium"
              "SplitDragHandleLarge"
            ]));
            default = "SplitDragHandleSmall";
            description = ''
              Control the size of the handle between panels

              Type: Enum
              Choices: 
                - SplitDragHandleSmall
                - SplitDragHandleMedium
                - SplitDragHandleLarge
            '';
          };
          SplitViewVisibility = mkOption {
            type = nullOr (either str (enum [ 
              "AlwaysShowSplitHeader"
              "ShowSplitHeaderWhenNeeded"
              "AlwaysHideSplitHeader"
            ]));
            default = "ShowTabBarWhenNeeded";
            description = ''
              Control the visibility of the whole tab bar

              Type: Enum
              Choices: 
                - AlwaysShowSplitHeader
                - ShowSplitHeaderWhenNeeded
                - AlwaysHideSplitHeader
            '';
          };
        };
      };
      default = {};
      description = "SplitView";
    };    
    "TabBar" = with types; mkOption {
      type = submodule {
        options = { 
          CloseTabButton = mkOption {
            type = nullOr (either str (enum [ 
              "OnEachTab"
              "OnTabBar"
              "None"
            ]));
            default = "OnEachTab";
            description = ''
              Control where the "Close tab" button will be displayed

              Type: Enum
              Choices: 
                - OnEachTab
                - OnTabBar
                - None
            '';
          };
          CloseTabOnMiddleMouseButton = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Allow middle-clicking on open tabs to close them

              Type: Bool
            '';
          };
          ExpandTabWidth = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Expand the tab widths

              Type: Bool
            '';
          };
          NewTabBehavior = mkOption {
            type = nullOr (either str (enum [ 
              "PutNewTabAtTheEnd"
              "PutNewTabAfterCurrentTab"
            ]));
            default = "PutNewTabAtTheEnd";
            description = ''
              Control where to put the new tab

              Type: Enum
              Choices: 
                - PutNewTabAtTheEnd
                - PutNewTabAfterCurrentTab
            '';
          };
          NewTabButton = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Control the visibility of 'New Tab' button on the tab bar

              Type: Bool
            '';
          };
          TabBarPosition = mkOption {
            type = nullOr (either str (enum [ 
              "Top"
              "Bottom"
            ]));
            default = "Top";
            description = ''
              Control the position of the tab bar

              Type: Enum
              Choices: 
                - Top
                - Bottom
            '';
          };
          TabBarStyleSheet = mkOption {
            type = nullOr str;
            default = "QTabBar::tab { min-width: 2em ; max-width: 25em }";
            description = ''
              Control the visual style of the tab bar

              Type: String
            '';
          };
          TabBarUseUserStyleSheet = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use a user-defined .css file for the tab bar

              Type: Bool
            '';
          };
          TabBarUserStyleSheetFile = mkOption {
            type = nullOr str;
            default = "";
            description = ''
              The .css file to use for the tab bar style

              Type: Url
            '';
          };
          TabBarVisibility = mkOption {
            type = nullOr (either str (enum [ 
              "AlwaysShowTabBar"
              "ShowTabBarWhenNeeded"
              "AlwaysHideTabBar"
            ]));
            default = "ShowTabBarWhenNeeded";
            description = ''
              Control the visibility of the whole tab bar

              Type: Enum
              Choices: 
                - AlwaysShowTabBar
                - ShowTabBarWhenNeeded
                - AlwaysHideTabBar
            '';
          };
        };
      };
      default = {};
      description = "TabBar";
    };    
    "ThumbnailsSettings" = with types; mkOption {
      type = submodule {
        options = { 
          EnableThumbnails = mkOption {
            type = nullOr (either str bool);
            default = true;
            description = ''
              

              Type: Bool
            '';
          };
          ThumbnailAlt = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use Alt to display a thumbnail

              Type: Bool
            '';
          };
          ThumbnailCtrl = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use Ctrl to display a thumbnail

              Type: Bool
            '';
          };
          ThumbnailShift = mkOption {
            type = nullOr (either str bool);
            default = false;
            description = ''
              Use Shift to display a thumbnail

              Type: Bool
            '';
          };
          ThumbnailSize = mkOption {
            type = nullOr (either str int);
            default = 250;
            description = ''
              Thumbnail Width

              Type: Int
            '';
          };
        };
      };
      default = {};
      description = "ThumbnailsSettings";
    };    
  };
  config = mkIf cfg.enable {
    programs.plasma.files."konsolerc" = cfg.konsole;
  };
}
