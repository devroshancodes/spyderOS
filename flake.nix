{
	description = "SpyderOS - A sleek, minimal, high-efficiency NixOS distribution";

	inputs = {
  	nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mangowm.url = "github:mangowm/mango";
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
			inputs.nixpkgs.follows = "nixpkgs";
  	};
};

	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, mangowm, dms, ... }@inputs: {  
  	nixosConfigurations.spyderos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
    
      modules = [
        ./spyderos/default.nix
        
				{ nixpkgs.hostPlatform = "x86_64-linux"; }

        { nixpkgs.config.allowUnfree = true ; }

        home-manager.nixosModules.home-manager 
				{
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
					home-manager.backupFileExtension = "bkup";
          home-manager.users.spyx = import ./spyderos/desktop/home-spyx.nix;
					home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
}
