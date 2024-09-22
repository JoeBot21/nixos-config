{

  description = "JoeBot-Workstation-config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url  ="github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
  
  outputs = inputs@ { self, nixpkgs, home-manager, plasma-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      joebotworkstation = lib.nixosSystem {
        inherit system;
        modules = [ ./system/configuration.nix ];
      };
    };
    homeConfigurations."joebot" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        inputs.plasma-manager.homeManagerModules.plasma-manager
        ./user/home.nix
      ];
    };
  };
}
