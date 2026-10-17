{ config, pkgs, ... }:

{
  imports = [   
    ./system/apps.nix
    ./system/audio.nix
    ./system/bluetooth.nix
    ./system/bootloader.nix
    ./system/btrfs.nix
		./system/dms.nix
		./system/hardware-configuration.nix
		./system/HDD.nix
		./system/jellyfin.nix
    ./system/mangowm.nix
    ./system/networking.nix
		./system/services.nix
		./system/user.nix
    ./system/virtualization.nix
		./hardware/intel-skylake.nix
  ];
}
