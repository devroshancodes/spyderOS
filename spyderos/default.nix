{ config, pkgs, ... }:

{
  imports = [   
    ./core/apps.nix
    ./core/audio.nix
    ./core/bluetooth.nix
    ./core/bootloader.nix
    ./core/btrfs.nix
		./core/HDD.nix
		./core/user.nix
    ./core/networking.nix
		./core/services.nix
    ./hardware/intel-skylake.nix
    ./desktop/dms.nix
    ./desktop/mangowm.nix
  ];
}
