
{ config, pkgs, lib, ... }:
  let
    nixvim = import (builtins.fetchGit {
      url = "https://github.com/nix-community/nixvim";
      ref = "nixos-25.05";
    });
  in {
    imports = [ <home-manager/nixos> ];

    home-manager.useGlobalPkgs = true;

    # Nixos definition of the user account
    users.users.joebot = {
      isNormalUser = true;
      description = "JoeBot";
      home = "/home/joebot";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        asunder
        blender
        deja-dup
        kdePackages.kate
        keepassxc
        librecad
        mpc-cli
        picard
        retroshare
        xournalpp
      ];
    };

    # Home Manager configuration
    home-manager.users.joebot = { pkgs, ... }: {
      imports = [ nixvim.homeModules.nixvim ];

      programs = {
        bash = {
          enable = true;
          initExtra = "eval $(ssh-agent -s) >/dev/null";
        };

        firefox.enable = true;

        git = {
          enable =  true;
          package = pkgs.gitFull;
          lfs.enable = true;
          userName = "JoeBot21";
          userEmail = "joe.bears77@gmail.com";
          extraConfig = {
            init.defaultBranch = "main";
          };
        };

        ledger = {
          enable = true;
          extraConfig = "--file ~/Documents/ledger.dat";
        };

        ncmpcpp.enable = true;
        neomutt.enable = true;

        nixvim = {
          enable = true;
          colorschemes.gruvbox.enable = true;
        };

        ssh = {
          enable = true;
          addKeysToAgent = "yes";
          extraConfig = "AddressFamily inet";
        };
      };

      services = {
        mpd = {
          enable = true;
          musicDirectory = "~/Music";
          dataDir = "/home/joebot/.local/state/mpd";
        };

        mpd-mpris.enable = true;
      };


      # This value determines the Home Manager release that your configuration is
      # compatible with. This helps avoid breakage when a new Home Manager release
      # introduces backwards incompatible changes.
      #
      # You should not change this value, even if you update Home Manager. If you do
      # want to update teh value, them make sure to first check the Home Manager
      # release notes.
      home.stateVersion = "25.05";  # Please read the comment before changing.
    };

    # nixvim configuration
  }
