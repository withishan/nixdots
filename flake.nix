{
  description = "nixdoots";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen = {
      url = "github:/InioX/Matugen";
    };

    pond = {
      url = "gitlab:Morgenkaff/flake-for-pond";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
     url = "github:sodiboo/niri-flake";
     inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = 
  { 
  self,
  nixpkgs, 
  home-manager, 
  nixvim, 
  pond,
  zen-browser,
  niri,
  ... 
  }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem 
    {
      inherit system; 
      specialArgs = { inherit inputs; };
      modules = [ 
        ./configuration.nix 
        home-manager.nixosModules.home-manager 
	      {
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.ishan = { 
	          imports = [ 
	            ./modules/home.nix 
	            nixvim.homeManagerModules.nixvim
              niri.homeModules.niri
	          ]; 
	        }; 
        }
      ];
    };
  };
}
