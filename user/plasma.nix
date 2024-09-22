{config, pkgs, ... }:

{
  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    hotkeys.commands = {
      "launch-konsole" = {
        name = "Launch Konsole";
        keys = ["Meta+Enter"];
        command = "konsole";
      };
    };
  };
}
