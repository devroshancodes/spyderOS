{ config, pkgs, ... }:

{
	virtualisation.podman = {
		enable = true;
		dockerCompat = true;
	};

	users.users.${config.spyderos.user.name} = {
		subUidRanges = [{ startUid = 100000; count = 65536; }];
		subGidRanges = [{ startGid = 100000; count = 65536; }];
	};
}
