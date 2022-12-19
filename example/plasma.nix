{ ... }:
{
  programs.plasma = {
    enable = true;

    baloo = { 
      "General" = { 
        "dbVersion" = "2";
        "exclude filters" = "*~,*.part,*.o,*.la,*.lo,*.loT,*.moc,moc_*.cpp,qrc_*.cpp,ui_*.h,cmake_install.cmake,CMakeCache.txt,CTestTestfile.cmake,libtool,config.status,confdefs.h,autom4te,conftest,confstat,Makefile.am,*.gcode,.ninja_deps,.ninja_log,build.ninja,*.csproj,*.m4,*.rej,*.gmo,*.pc,*.omf,*.aux,*.tmp,*.po,*.vm*,*.nvram,*.rcore,*.swp,*.swap,lzo,litmain.sh,*.orig,.histfile.*,.xsession-errors*,*.map,*.so,*.a,*.db,*.qrc,*.ini,*.init,*.img,*.vdi,*.vbox*,vbox.log,*.qcow2,*.vmdk,*.vhd,*.vhdx,*.sql,*.sql.gz,*.ytdl,*.class,*.pyc,*.pyo,*.elc,*.qmlc,*.jsc,*.fastq,*.fq,*.gb,*.fasta,*.fna,*.gbff,*.faa,po,CVS,.svn,.git,_darcs,.bzr,.hg,CMakeFiles,CMakeTmp,CMakeTmpQmake,.moc,.obj,.pch,.uic,.npm,.yarn,.yarn-cache,__pycache__,node_modules,node_packages,nbproject,core-dumps,lost+found";
        "exclude filters version" = "8";
      };
    };
    dolphin = { 
      "IconsMode" = { 
        "PreviewSize" = "256";
      };
    };
    krunner = { 
      "General" = { 
        "FreeFloating" = true;
      };
    };
    kwin = { 
      "Effect-windowview" = { 
        "BorderActivateAll" = "9";
      };
      "TabBox" = { 
        "LayoutName" = "informative";
      };
    };
    spectacle = { 
      "General" = { 
        "onLaunchAction" = "DoNotTakeScreenshot";
      };
      "GuiConfig" = { 
        "captureMode" = "5";
      };
      "Save" = { 
        "lastSaveAsLocation" = "file:///home/dominik/Downloads/Screenshot_20221213_170323.png";
        "lastSaveLocation" = "file:///home/dominik/Downloads/Screenshot_20221213_170323.png";
      };
    };
  };
}
