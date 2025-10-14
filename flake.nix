{

  description = "Full configuration flake for personal / development laptop";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nixvim.url = "github:nix-community/nixvim";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ...}: 
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in 
  {
    nixosConfigurations = {
      elitebook = lib.nixosSystem {
      	inherit system;
	modules = [ ./system/configuration.nix ];
      };
    };
    homeConfigurations = {
      mael = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	modules = [ 
	  nixvim.homeManagerModules.nixvim
	  ./home/home.nix
	];
      };
    };
  };

}
