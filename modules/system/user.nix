{ config, lib, pkgs, ... }:

{
	options.spyderos.user.name = lib.mkOption {
		type = lib.types.str;
		example = "nix1";
		description = "Name of the primary user account";
	};

	config = {
		users.users.${config.spyderos.user.name} = { 
			isNormalUser = true;
			extraGroups = [ "wheel" "audio" "video" "greeter" "wireshark" "networkmanager" ];
			shell = pkgs.zsh;
		};

			};

}
