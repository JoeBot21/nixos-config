{ config, pkgs, ... }:

{
  imports = [
    ./system
    ./home
  ];
}
