{
  description = "My Nix";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-23.05";
    };
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
      nixos-dev-vm = lib.nixosSystem {
      	system = "x86_64-linux";
	modules = [
	  ./configuration.nix
	];
      };
    };
  };
}
