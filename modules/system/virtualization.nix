{ config, pkgs, ... }:

{
	virtualisation.podman = {
		enable = true;
		dockerCompat = true;
	};

	users.users.spyx = {
		subUidRanges = [{ startUid = 100000; count = 65536; }];
		subGidRanges = [{ startGid = 100000; count = 65536; }];
	};
}
