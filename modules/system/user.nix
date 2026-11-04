{ config, lib, pkgs, ... }:

let 
	user = config.spyderos.user;

in
{
	options.spyderos.user.name = lib.mkOption {
		type = lib.types.str;
		example = "nix1";
		description = "Name of the primary user account";
	};

	config = {
		users.users.${user.name} = { 
			isNormalUser = true;
			extraGroups = [ "wheel" "audio" "video" "greeter" "wireshark" "networkmanager" ];
			shell = pkgs.zsh;
		};

	};

}
