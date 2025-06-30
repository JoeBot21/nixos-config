{

  description = "JoeBot-Workstation-config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = inputs@ { self, nixpkgs, home-manager, ... }:
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
        ./user/home.nix
      ];
    };
  };
}
