{
  description = "nixdoots";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    textfox.url = "github:adriankarlen/textfox";
  };

  outputs = 
  { 
  self,
  nixpkgs, 
  home-manager, 
  nixvim, 
  ... 
  }@inputs: 
    let
      system = "86_64-linux";
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
	          ]; 
	        }; 
        }
      ];
    };
  };
}
