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
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      nixos-dev-vm = lib.nixosSystem {
      	inherit system;
	modules = [
	  ./configuration-vm.nix
	];
      };
      hal = lib.nixosSystem {
        inherit system;
	modules = [
	  ./configuration-hal.nix
	];
      };
    };
    homeConfigurations."invincent" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

     # Specify your home configuration modules here, for example,
     # the path to your home.nix.
      modules = [ 
        ./home.nix
        hyprland.homeManagerModules.default
        { wayland.windowManager.hyprland.enable = true; } 
      ];

     # Optionally use extraSpecialArgs
     # to pass through arguments to home.nix
    };
  };
}
