{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    configure = {
      customRC = ''
        set number
        set expandtab
        set tabstop=2
        set shiftwidth=2
      '';
    };
  };
}
