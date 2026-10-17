{ config, lib, pkgs, ... }:

{

# System level fstab config
fileSystems."/mnt/HDD" = {
	device = "/dev/disk/by-uuid/EFFF-F48F";
	fsType = "exfat";
	options = [
		"defaults"
		"noauto"
		"nofail"
		"x-systemd.automount"
		"x-systemd.idle-timeout=10m"
		"uid=1000"
		"gid=100"
		"dmask=007"
		"fmask=0113"
		];
	};

boot.initrd.availableKernelModules = [ "usbcore" "usb_storage" "sd_mod" "ehci_hcd" "ohci_hcd" "xhci_hcd" ];
boot.supportedFilesystems = [ "exfat" ];

# User level Home manager config
home-manager.users.spyx = { config, ... }: {
	home.file = {
		"videos/Videos" = {
			source = config.lib.file.mkOutOfStoreSymlink "/mnt/HDD/Videos";
			};
		"pictures/Pictures" = {
			source = config.lib.file.mkOutOfStoreSymlink "/mnt/HDD/Pictures";
			};
		};
	};

}
			
