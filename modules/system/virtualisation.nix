{ config, lib, pkgs, ... }:
let 
	virt = config.spyderos.virtualisation.enable;

in
{
	options.spyderos.virtualisation.enable = 
		lib.mkEnableOption "podman and rootless container support";

	config = lib.mkIf virt { 
		virtualisation.podman = {
			enable = true;
			dockerCompat = true;
		};
		users.users.${config.spyderos.user.name} = {
			subUidRanges = [{ startUid = 100000; count = 65536; }];
			subGidRanges = [{ startGid = 100000; count = 65536; }];
		};
	};
}
