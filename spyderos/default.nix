{ config, pkgs, ... }:

{
  imports = [   
    ./core/apps.nix
    ./core/audio.nix
    ./core/bluetooth.nix
    ./core/bootloader.nix
    ./core/btrfs.nix
		./core/hardware-configuration.nix
		./core/HDD.nix
    ./core/networking.nix
		./core/services.nix
		./core/user.nix
    ./core/virtualization.nix
		./desktop/dms.nix
		./desktop/jellyfin.nix
    ./desktop/mangowm.nix
		./hardware/intel-skylake.nix	
  ];
}
