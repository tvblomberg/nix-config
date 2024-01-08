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
    agenix.url = "github:ryantm/agenix";
    dotnet5.url = "github:nixos/nixpkgs/2d38b664b4400335086a713a0036aafaa002c003";
    node14-15-1.url = "github:nixos/nixpkgs/f6e519f39e4d6ee694c2a3d5de8f3f263c57980b";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, agenix, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    # Dev Shells
    devShells."${system}" = {
      dotnet5 = (import ./shells/dotnet5.nix { inherit pkgs inputs; });
      dotnet6 = (import ./shells/dotnet6.nix { inherit pkgs inputs; });
      dotnet8 = (import ./shells/dotnet8.nix { inherit pkgs inputs; });
    };

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
          agenix.nixosModules.default
          ./hardware/configuration-hal.nix
        ];

        specialArgs = { inherit inputs; };

      };
    };

    homeConfigurations."invincent" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [ 
        inputs.agenix.homeManagerModules.age
        ./home.nix

      ];

      extraSpecialArgs = { inherit inputs; };

    };
  };
}
