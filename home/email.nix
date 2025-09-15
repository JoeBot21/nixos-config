{ config, pkgs, lib, ... }:
{
  home-manager.users.joebot = {
    services = {
      mbsync.enable = true;
    };

    programs = {
      mbsync.enable = true;
      msmtp.enable = true;

      neomutt = {
        enable = true;
        sidebar.enable = true;
        vimKeys = true;
        sort = "reverse-date";
      };
    };

    accounts.email = {
      maildirBasePath = "~/.local/share/mail";
    };
  };
}
