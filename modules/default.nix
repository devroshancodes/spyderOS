{ config, pkgs, ... }:

{
  imports = [   
    ./system/apps.nix
    ./system/audio.nix
    ./system/bluetooth.nix
    ./system/boot.nix
    ./system/btrfs.nix
		./system/dms.nix
		./system/jellyfin.nix
    ./system/mangowm.nix
    ./system/networking.nix
		./system/services.nix
		./system/user.nix
    ./system/virtualization.nix
  ];
}
