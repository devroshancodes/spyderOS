{
  description = "SpyderOS - A sleek, minimal, high-efficiency NixOS distribution";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mangowm.url = "github:mangowm/mango";
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
			inputs.nixpkgs.follows = "nixpkgs";
  	};
		
		#dankmediashell.url = "github:AvengeMedia/DankMaterialShell";
 
 outputs = { self, nixpkgs, home-manager, mangowm, dankmediashell, ... }@inputs: {  
     nixosConfigurations.spyderos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
    
      modules = [
        ./spyderos/core/hardware-configuration.nix
        ./spyderos/default.nix
        
        { nixpkgs.config.allowUnfree = true ; }
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.spyx = import ./spyderos/desktop/home-spyx.nix;
        	}
      	];
    	};
  	};
	};
}
