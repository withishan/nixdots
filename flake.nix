{
  description = "nixdoots";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
    };
  };

  outputs = 
  { 
  self,
  nixpkgs, 
  niri, 
  home-manager, 
  nixvim, 
  spicetify-nix,
  ... 
  }@inputs: 
    let
      system = "86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixpkgs.overlays = [ niri.overlays.niri ];
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem 
    {
      inherit system; 
      specialArgs = { inherit inputs; };
      modules = [ 
        ./configuration.nix 
        home-manager.nixosModules.home-manager 
	      {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.ishan = { 
	          imports = [ 
	            ./modules/home.nix 
	            niri.homeModules.niri
	            nixvim.homeManagerModules.nixvim
              spicetify-nix.homeManagerModule
	          ]; 
	        }; 
        }
      ];
    };
  };
}
