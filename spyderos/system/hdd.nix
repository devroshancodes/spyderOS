{ config, lib, pkgs, ... }:

{

	fileSystems."/mnt/hdd" = {
		device = "/dev/disk/by-uuid/EFFF-F48F";
		fsType = "exfat";
		options = [
			"nofail"
			"x-systemd.automount"
			"x-systemd.idle-timeout=10m"
			"x-systemd.device-timeout=3s"
			"x-systemd.mount-timeout=5s"
			"uid=1000"
			"gid=100"
			"dmask=007"
			"fmask=0113"
		];
	};

	boot.supportedFilesystems = [ "exfat" ];

	systemd.settings.Manager = { 
		DefaultTimeoutStopSec = "10s";
	};

	home-manager.users.spyx = { config, ... }: {
		home.file = {
			"videos/Videos" = {
				source = config.lib.file.mkOutOfStoreSymlink "/mnt/hdd/Videos";
			};
			"pictures/Pictures" = {
				source = config.lib.file.mkOutOfStoreSymlink "/mnt/hdd/Pictures";
			};
		};
	};

}
			
