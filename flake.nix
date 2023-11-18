{
  description = "My Nix";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";
    xremap-flake.url = "github:xremap/nix-flake";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos-dev-vm = lib.nixosSystem {
      	inherit system;
	modules = [
	  ./hardware/configuration-vm.nix
	];
      };
      hal = lib.nixosSystem {
        inherit system;
	modules = [
	  ./hardware/configuration-hal.nix
	];
      };
    };
    homeConfigurations."invincent" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [ 
        ./home.nix
      ];

      extraSpecialArgs = { inherit inputs; };

    };
  };
}
