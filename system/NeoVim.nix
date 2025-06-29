{ config, pkgs, ... }:

{
  # programs.nixvim = {
    # enable = true;

    # colorschemes.gruvbox.enable = true;
    # plugins.lualine.enable = true;
  # };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    configure = {
      customRC = ''
        set number
        set expandtab
        set tabstop=4
        set shiftwidth=4
      '';
    };
  };
}
